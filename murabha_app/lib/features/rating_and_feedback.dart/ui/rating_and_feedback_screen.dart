import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/core/widgets/app_button.dart';
import 'package:murabha_app/core/widgets/app_textfield.dart';

class RatingAndFeedbackScreen extends StatelessWidget {
  final double rating;
  final Function(double)? onRatingChanged;
  final TextEditingController? feedbackController;

  const RatingAndFeedbackScreen({
    super.key,
    this.rating = 0, // 👈 default value
    this.onRatingChanged,
    this.feedbackController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rating & Feedback'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            children: [
              Text(
                'How was your experience?',
                style: TextStyleManager.font16BlackBold,
              ),
              VerticalSpacing(20.h),
              RatingBar.builder(
                initialRating: rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.h),
                itemBuilder: (context, _) =>
                    Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: onRatingChanged ?? (val) {}, // 👈 fallback
              ),
              VerticalSpacing(20.h),
              AppUniversaltextField(
                controller: feedbackController,
                text: 'Write your feedback here...',
                isObscureText: false,
                filledColor: Colors.grey[100],
                borderRadius: 12.r,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your feedback';
                  }
                  return null;
                },
              ),
              VerticalSpacing(20.h),
              AppUniversalButton(
                onPressed: () {
                  final feedback = feedbackController?.text.trim() ?? '';
                  print('Rating: $rating');
                  print('Feedback: $feedback');
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Thank you!'),
                      content: const Text('Thank you for your feedback!'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'OK',
                            style: TextStyleManager.font12PrimaryColorRegular,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                text: 'Submit',
                backgroundColor: ColorsManager.primaryColor,
                borderRadius: 12.r,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
