package com.example.keyboard_cursive_writing;

import android.inputmethodservice.InputMethodService;
import android.inputmethodservice.KeyboardView;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.widget.FrameLayout;

import io.flutter.embedding.android.FlutterView;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.dart.DartExecutor;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.StringCodec;

public class MyInputMethodService extends InputMethodService implements KeyboardView.OnKeyboardActionListener {
    InputConnection inputConnection;

    private FlutterView flutterView;
    private static FlutterEngine flutterEngine;
    private View root;
    FrameLayout keyboardViewLL;

    private static final String KEYBOARD_CHANNEL = "keyboard_channel";
    private BasicMessageChannel<String> keyboardMessageChannel;

    @Override
    public View onCreateInputView() {

        return initView();
    }

    public View initView(){
        try {
            if (flutterEngine == null) {
                flutterEngine = new FlutterEngine(getBaseContext());

                flutterEngine.getNavigationChannel().setInitialRoute("/keyboard");
                flutterEngine.getDartExecutor().executeDartEntrypoint(
                        DartExecutor.DartEntrypoint.createDefault()
                );
            }

            root = getLayoutInflater().inflate(R.layout.keyboard_view, null);
            flutterView = root.findViewById(R.id.flutter_view);
            flutterView.attachToFlutterEngine(flutterEngine);
            keyboardViewLL = root.findViewById(R.id.keyboardViewLL);
            keyboardMessageChannel = new BasicMessageChannel<String>(flutterEngine.getDartExecutor(), KEYBOARD_CHANNEL, StringCodec.INSTANCE);
            keyboardMessageChannel.
                    setMessageHandler(new BasicMessageChannel.MessageHandler<String>() {
                        @Override
                        public void onMessage(String letter, BasicMessageChannel.Reply<String> reply) {
                            inputConnection = getCurrentInputConnection();

                            if(letter.equalsIgnoreCase("delete")){
                                onDelete();
                            }else{
                                inputConnection.commitText(letter, 1);
                            }
                            //reply.reply(EMPTY_MESSAGE);
                        }
                    });

            flutterEngine.getLifecycleChannel().appIsResumed();

        }
        catch (Exception e){
            e.printStackTrace();
        }
        return root;
    }

    @Override
    public void onStartInputView(EditorInfo info, boolean restarting) {
        super.onStartInputView(info, restarting);

        setInputView(onCreateInputView());

    }

    @Override
    public View onCreateCandidatesView() {
        return super.onCreateCandidatesView();
    }

    @Override
    public void onPress(int i) {

    }

    @Override
    public void onRelease(int i) {
    }

    void onDelete(){
        inputConnection.deleteSurroundingText(1, 0);
    }

    @Override
    public void onKey(int primatyCode, int[] keyCodes) {

    }

    @Override
    public void onText(CharSequence charSequence) {
    }

    @Override
    public void swipeLeft() {

    }

    @Override
    public void swipeRight() {

    }

    @Override
    public void swipeDown() {
    }

    @Override
    public void swipeUp() {

    }
}