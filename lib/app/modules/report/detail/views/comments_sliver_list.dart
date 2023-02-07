import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/extensions/index.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/repositories/index.dart';
import 'package:moderator_app/app/utils/helpers.dart';
import 'package:moderator_app/app/widgets/index.dart';
import 'package:moderator_app/locales/index.dart';

class CommentSliverList extends StatefulWidget {
  final int reportId;

  const CommentSliverList(
    this.reportId, {
    Key? key,
  }) : super(key: key);

  @override
  State<CommentSliverList> createState() => CommentSliverListState();
}

class CommentSliverListState extends State<CommentSliverList> {
  final reportRepository = ReportRepository();
  final commentRepository = CommentRepository();
  final PagingController<int, Comment> pagingController = PagingController(firstPageKey: 1);

  deleteComment(Comment comment) async {
    final confirm = await showConfirmDialog(
      title: LocaleKeys.title_delete_a_comment,
      content: LocaleKeys.phrase_delete_comment,
    );

    if (confirm) {
      startLoading();
      final result = await commentRepository.deleteComment(comment.id);
      stopLoading();

      if (result == true) {
        pagingController.itemList?.remove(comment);
        pagingController.notifyListeners();
      }
    }
  }

  refresh() async {
    pagingController.refresh();
  }

  _fetchPage(int page) async {
    try {
      final pagination = await reportRepository.listComments(
        reportId: widget.reportId,
        page: page,
      );
      final isLastPage = !pagination.hasMorePage;
      pagingController.appendLastPage([]);
      if (isLastPage) {
        pagingController.appendLastPage(pagination.getData());
      } else {
        final nextPageKey = pagination.currentPage + 1;
        pagingController.appendPage(pagination.getData(), nextPageKey);
      }
    } catch (error) {
      print(error);
      pagingController.error = error;
    }
  }

  @override
  void initState() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PagedSliverList<int, Comment>(
      pagingController: pagingController,
      builderDelegate: PagedChildBuilderDelegate<Comment>(
        newPageProgressIndicatorBuilder: (context) => Center(
          child: const LoadingWidget().paddingSymmetric(vertical: 10),
        ),
        firstPageProgressIndicatorBuilder: (context) => const Center(
          child: LoadingWidget(),
        ),
        noItemsFoundIndicatorBuilder: (context) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              16.y,
              Text(
                LocaleKeys.label_comment_empty,
                style: Get.textTheme.headline6?.copyWith(
                  color: AppColors.greyText,
                ),
              ),
              16.y,
            ],
          ),
        ),
        firstPageErrorIndicatorBuilder: (context) {
          String errorMessage = LocaleKeys.phrase_not_your_mistake;

          if (pagingController.error is String) {
            errorMessage = pagingController.error as String;
          }

          return ErrorView(
            image: Image.asset(
              AppStrings.errorImage,
              width: Get.width * 0.8,
            ),
            title: LocaleKeys.label_something_went_wrong,
            description: errorMessage,
            bottom: FilledButton(
              onPressed: () {
                pagingController.refresh();
              },
              icon: const Icon(AppIcons.refresh),
              child: Text(LocaleKeys.button_try_again),
            ),
          );
        },
        itemBuilder: (context, Comment comment, index) {
          late Widget avatar;
          late String? name;
          if (comment.commenter?.institution != null) {
            avatar = UserAvatar(
              comment.commenter!.institution!.logoUrl,
              defaultAsset: AppStrings.serviceProviderPlaceholder,
            );
            name = comment.commenter!.institution!.name;
          } else {
            avatar = UserAvatar(
              comment.commenter?.profilePhotoUrl,
              defaultAsset: AppStrings.avatarPlaceholder,
            );
            name = comment.commenter?.fullName;
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.x,
              avatar.sized(40).circle.marginOnly(
                    top: 10,
                  ),
              10.x,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      margin: EdgeInsets.zero,
                      surfaceTintColor: AppColors.backgroundContrastColor(context),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name ?? LocaleKeys.label_no_name,
                              style: Get.textTheme.subtitle1?.copyWith(
                                fontWeight: name != null ? FontWeight.bold : null,
                                color: name != null ? null : AppColors.greyText,
                                // fontStyle: name != null ? null : FontStyle.italic,
                              ),
                            ),
                            if (comment.text != null) Text(comment.text!),
                            if (comment.medias != null && comment.medias!.isNotEmpty) ...[
                              10.y,
                              Grid(
                                crossAxisCount: 3,
                                children: [
                                  for (final media in comment.medias!)
                                    UserAvatar(
                                      media.mediaUrl,
                                      previewImages: comment.medias!.map((e) => NetworkImage(e.mediaUrl)).toList(),
                                      previewIndex: comment.medias!.indexOf(media),
                                    ).roundedBordered(8),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    if (comment.createdAt != null)
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              displayReadableDate(comment.createdAt!),
                              style: const TextStyle(
                                color: AppColors.greyText,
                                fontSize: 12,
                              ),
                            ).paddingOnly(
                              top: 4,
                              left: 12,
                              right: 12,
                            ),
                          ),
                          if (comment.canDelete ?? false)
                            GestureDetector(
                              onTap: () {
                                deleteComment(comment);
                              },
                              child: Material(
                                child: Text(
                                  LocaleKeys.button_delete,
                                  style: const TextStyle(
                                    color: AppColors.danger,
                                    fontSize: 12,
                                  ),
                                ),
                              ).paddingSymmetric(vertical: 6),
                            ),
                        ],
                      ),
                  ],
                ),
              ),
              10.x,
            ],
          ).paddingOnly(
            bottom: 16,
          );
        },
      ),
    );
  }
}
