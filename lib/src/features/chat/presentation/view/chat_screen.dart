import 'package:flutter/material.dart';
import 'package:supercoder_test/src/utils/exports.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late CreateCharacterCubit createCharacterCubit;
  late ChatCubit chatCubit;

  @override
  void initState() {
    super.initState();
    createCharacterCubit = BlocProvider.of<CreateCharacterCubit>(context);
    chatCubit = BlocProvider.of<ChatCubit>(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    chatCubit.getChatData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 40,
                  spreadRadius: 15,
                ),
              ],
              color: appTheme.gray900,
              image: DecorationImage(
                  image: (createCharacterCubit.currentCharacter == null
                      ? AssetImage(ImageConstant.imgGroup80)
                      : NetworkImage(createCharacterCubit.currentCharacter!
                          .backgroundImageUrl!)) as ImageProvider,
                  fit: BoxFit.cover)),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppbarLeadingImage(
                        imagePath: ImageConstant.imgArrowLeft,
                        margin: EdgeInsets.only(
                            left: 7.h, top: 16.v, bottom: 118.v),
                        onTap: () {
                          Constants.hideLoadingOrNavBack;
                        }),
                    const Spacer(),
                    Center(
                      child: AppbarTitle(
                        text: "Chat with character name",
                        margin: EdgeInsets.only(top: 18.v, bottom: 119.v),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                BlocBuilder<ChatCubit, ChatState>(
                  bloc: chatCubit,
                  builder: (context, state) {
                    if (state is ChatLoading) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                    if (state is ChatError) {
                      return Center(
                        child: Text(state.message),
                      );
                    }

                    return chatCubit.messageList == null ||
                            chatCubit.messageList!.isEmpty
                        ? const Center(
                            child: Text("No messages"),
                          )
                        : Expanded(
                            child: ListView.separated(
                                controller: chatCubit.scrollController,
                                shrinkWrap: true,
                                itemBuilder: (c, i) => chatCubit
                                            .messageList?.first.id ==
                                        chatCubit.messageList?[i].id
                                    ? IntroMessageWidget(
                                        introMessage:
                                            chatCubit.messageList?[i].text ??
                                                "")
                                    : chatCubit.messageList!.length >= 2 &&
                                            (chatCubit.messageList?[1].id ==
                                                chatCubit.messageList?[i].id)
                                        ? FirstMessageAndAIMessageWidget(
                                            message:
                                                chatCubit.messageList?[i].text,
                                            isFirstMessage: true,
                                          )
                                        : chatCubit.messageList?[i].speaker ==
                                                "user"
                                            ? MyMessageWidget(
                                                message: chatCubit
                                                        .messageList?[i].text ??
                                                    "")
                                            : FirstMessageAndAIMessageWidget(
                                                message: chatCubit
                                                    .messageList?[i].text),
                                separatorBuilder: (c, i) => SizedBox(
                                      height: 8.v,
                                    ),
                                itemCount: chatCubit.messageList?.length ?? 0),
                          );
                  },
                )
              ],
            ),
          )),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black,
              blurRadius: 40,
              spreadRadius: 15,
              offset: Offset(0, 10)),
        ], color: Colors.black54),
        width: double.maxFinite,
        height: 150.v,
        padding: EdgeInsets.symmetric(horizontal: 12.h),
        margin: EdgeInsets.only(top: 15.v),
        //decoration: AppDecoration.gradientOnErrorToOnError,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.v,
            ),
            Text("Character Name",
                style:
                    theme.textTheme.titleLarge?.copyWith(color: Colors.white)),
            SizedBox(
              height: 10.v,
            ),
            CustomTextFormField(
                onFieldSubmitted: (String? v) {
                  chatCubit.sendMessage();
                },
                controller: chatCubit.messageController,
                hintText: "Type a message",
                textInputAction: TextInputAction.send,
                suffix: IconButton(
                    iconSize: 20,
                    onPressed: () {
                      chatCubit.sendMessage();
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                    )),
                //maxLines: 2,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12.h, vertical: 12.v))
          ],
        ),
      ),
    );
  }
}

class MyMessageWidget extends StatelessWidget {
  final String message;
  const MyMessageWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      // height: 53.v,
      width: 116.h,
      text: message,
      margin: EdgeInsets.only(right: 12.h),
      buttonStyle: CustomButtonStyles.fillGrayTL16.copyWith(
          padding:
              MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 25.v))),
      buttonTextStyle: CustomTextStyles.titleSmallWhiteA700,
      alignment: Alignment.centerRight,
    ).addingAlign(context, alignmentGeometry: Alignment.bottomRight);
  }
}

class IntroMessageWidget extends StatelessWidget {
  final String introMessage;
  const IntroMessageWidget({
    super.key,
    required this.introMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 95.v,
      width: 286.h,
      margin: EdgeInsets.only(left: 5.h),
      padding: EdgeInsets.all(8.h),
      decoration: AppDecoration.fillOnError1.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 246.h,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Intro. ",
                  style: theme.textTheme.titleSmall,
                ),
                TextSpan(
                  text:
                      introMessage, //"Taking a deep breath, Yuzu gently knocks on the door and whispers.on the door...",
                  style: CustomTextStyles.titleSmallffa2a09c,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    ).addingAlign(context, alignmentGeometry: Alignment.bottomLeft);
  }
}

class FirstMessageAndAIMessageWidget extends StatelessWidget {
  final bool isFirstMessage;
  final String? message;
  const FirstMessageAndAIMessageWidget(
      {super.key, this.isFirstMessage = false, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 248.h,
      padding: EdgeInsets.all(8.h),
      decoration: AppDecoration.fillOnError1.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
          color: const Color(0xFF877A4E)),
      margin: EdgeInsets.only(left: 5.h),
      child: isFirstMessage
          ? RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        "Taking a deep breath, Yuzu gently knocks on the door and whispers.\n",
                    style: CustomTextStyles.bodyLargeNotoSansffbabbc0,
                  ),
                  TextSpan(
                    text: message ??
                        "Good morning, master. It's time to wake up. nyang",
                    style: CustomTextStyles.titleMediumNotoSansffffffff,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            )
          : Text(
              message ?? "Nothing",
              style: CustomTextStyles.titleMediumNotoSansffffffff,
            ),
    ).addingAlign(context, alignmentGeometry: Alignment.bottomLeft);
  }
}
