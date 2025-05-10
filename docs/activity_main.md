<?xml version="1.0" encoding="utf-8"?>

<androidx.coordinatorlayout.widget.CoordinatorLayout xmlns:android="http://schemas.android.com/apk/res/android"
xmlns:app="http://schemas.android.com/apk/res-auto"
xmlns:tools="http://schemas.android.com/tools"
android:id="@+id/main"
android:layout_width="match_parent"
android:layout_height="match_parent"
android:background="@color/background"
tools:context=".MainActivity">

    <androidx.core.widget.NestedScrollView
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:overScrollMode="never">

        <androidx.constraintlayout.widget.ConstraintLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:paddingHorizontal="16dp"
            android:paddingBottom="16dp">

            <!-- Moved header card inside NestedScrollView -->
            <com.google.android.material.card.MaterialCardView
                android:id="@+id/headerCard"
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:layout_marginTop="16dp"
                app:cardCornerRadius="20dp"
                app:cardElevation="4dp"
                app:layout_constraintEnd_toEndOf="parent"
                app:layout_constraintStart_toStartOf="parent"
                app:layout_constraintTop_toTopOf="parent">

                <!-- Header content remains the same -->
                <View
                    android:layout_width="match_parent"
                    android:layout_height="120dp"
                    android:background="@drawable/header_gradient" />

                <LinearLayout
                    android:layout_width="match_parent"
                    android:layout_height="wrap_content"
                    android:orientation="vertical"
                    android:padding="16dp">

                    <TextView
                        android:layout_width="wrap_content"
                        android:layout_height="wrap_content"
                        android:text="AUTOMATA"
                        android:textSize="28sp"
                        android:textColor="@color/white"
                        android:textStyle="bold"
                        android:letterSpacing="0.05"
                        android:layout_marginTop="12dp" />

                    <TextView
                        android:layout_width="wrap_content"
                        android:layout_height="wrap_content"
                        android:text="CASE STUDY"
                        android:textSize="18sp"
                        android:textColor="@color/white"
                        android:alpha="0.9"
                        android:letterSpacing="0.03" />

                    <View
                        android:layout_width="60dp"
                        android:layout_height="3dp"
                        android:background="@color/white"
                        android:alpha="0.7"
                        android:layout_marginTop="8dp" />
                </LinearLayout>
            </com.google.android.material.card.MaterialCardView>

            <com.google.android.material.card.MaterialCardView
                android:id="@+id/inputCard"
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:layout_marginTop="16dp"
                app:cardCornerRadius="16dp"
                app:cardElevation="2dp"
                app:strokeColor="#64B5F6"
                app:strokeWidth="1dp"
                app:layout_constraintEnd_toEndOf="parent"
                app:layout_constraintStart_toStartOf="parent"
                app:layout_constraintTop_toBottomOf="@id/headerCard">


            <LinearLayout
                    android:layout_width="match_parent"
                    android:layout_height="wrap_content"
                    android:orientation="vertical"
                    android:padding="20dp">

                    <TextView
                        android:layout_width="wrap_content"
                        android:layout_height="wrap_content"
                        android:text="Select a sequence"
                        android:textAppearance="?attr/textAppearanceHeadline6"
                        android:textStyle="bold" />

                    <View
                        android:layout_width="40dp"
                        android:layout_height="3dp"
                        android:layout_marginTop="8dp"
                        android:background="#64B5F6" />

                    <RadioGroup
                        android:id="@+id/sequenceGroup"
                        android:layout_width="match_parent"
                        android:layout_height="wrap_content"
                        android:layout_marginTop="16dp"
                        android:theme="@style/RadioButtonStyle">

                        <com.google.android.material.radiobutton.MaterialRadioButton
                            android:id="@+id/fibonacciOption"
                            android:layout_width="match_parent"
                            android:layout_height="wrap_content"
                            android:padding="8dp"
                            android:textColor="@color/black"
                            android:buttonTint="#90CAF9"
                            android:text="Fibonacci Sequence" />

                        <com.google.android.material.radiobutton.MaterialRadioButton
                            android:id="@+id/lucasOption"
                            android:layout_width="match_parent"
                            android:layout_height="wrap_content"
                            android:padding="8dp"
                            android:buttonTint="#90CAF9"
                            android:text="Lucas Numbers" />

                        <com.google.android.material.radiobutton.MaterialRadioButton
                            android:id="@+id/tribonacciOption"
                            android:layout_width="match_parent"
                            android:layout_height="wrap_content"
                            android:padding="8dp"
                            android:textColor="@color/black"
                            android:buttonTint="#90CAF9"
                            android:text="Tribonacci Sequence" />

                        <com.google.android.material.radiobutton.MaterialRadioButton
                            android:id="@+id/collatzOption"
                            android:layout_width="match_parent"
                            android:layout_height="wrap_content"
                            android:padding="8dp"
                            android:buttonTint="#90CAF9"
                            android:text="Collatz Sequence" />

                        <com.google.android.material.radiobutton.MaterialRadioButton
                            android:id="@+id/euclideanOption"
                            android:layout_width="match_parent"
                            android:layout_height="wrap_content"
                            android:padding="8dp"
                            android:buttonTint="#90CAF9"
                            android:text="Euclidean Algorithm" />

                    </RadioGroup>

                    <com.google.android.material.textfield.TextInputLayout
                        android:id="@+id/inputLayout"
                        style="@style/Widget.MaterialComponents.TextInputLayout.OutlinedBox"
                        android:layout_width="match_parent"
                        android:layout_height="wrap_content"
                        android:layout_marginTop="20dp"
                        android:hint="Number of terms"
                        app:counterEnabled="true"
                        app:counterMaxLength="3"
                        app:counterTextAppearance="@style/TextAppearance.MaterialComponents.Body2"
                        app:boxStrokeColor="#64B5F6"
                        app:hintTextColor="#64B5F6"
                        app:startIconTint="#64B5F6">

                        <com.google.android.material.textfield.TextInputEditText
                            android:id="@+id/numberInput"
                            android:layout_width="match_parent"
                            android:layout_height="wrap_content"
                            android:inputType="number"
                            android:maxLength="3"
                            android:textCursorDrawable="@drawable/custom_cursor" />/>
                    </com.google.android.material.textfield.TextInputLayout>

                    <com.google.android.material.textfield.TextInputLayout
                        android:id="@+id/secondInputLayout"
                        style="@style/Widget.MaterialComponents.TextInputLayout.OutlinedBox"
                        android:layout_width="match_parent"
                        android:layout_height="wrap_content"
                        android:layout_marginTop="16dp"
                        android:hint="Second number"
                        android:visibility="gone"
                        app:counterEnabled="true"
                        app:counterMaxLength="3"
                        app:boxStrokeColor="#64B5F6"
                        app:hintTextColor="#64B5F6"
                        app:startIconTint="#64B5F6">

                        <com.google.android.material.textfield.TextInputEditText
                            android:id="@+id/secondNumberInput"
                            android:layout_width="match_parent"
                            android:layout_height="wrap_content"
                            android:inputType="number"
                            android:maxLength="3"
                            android:textCursorDrawable="@drawable/custom_cursor" />/>
                    </com.google.android.material.textfield.TextInputLayout>

                    <com.google.android.material.button.MaterialButton
                        android:id="@+id/generateButton"
                        android:layout_width="match_parent"
                        android:layout_height="56dp"
                        android:layout_gravity="center"
                        android:layout_marginTop="20dp"
                        android:text="Generate Sequence"
                        app:backgroundTint="@null"
                        android:background="@drawable/button_gradient"
                        app:cornerRadius="28dp"
                        app:icon="@android:drawable/ic_media_play"
                        app:iconGravity="textStart"
                        app:iconTint="@color/white"
                        style="@style/Widget.MaterialComponents.Button.UnelevatedButton" />
                </LinearLayout>
            </com.google.android.material.card.MaterialCardView>

            <com.google.android.material.card.MaterialCardView
                android:id="@+id/resultCard"
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:layout_marginTop="24dp"
                android:layout_marginBottom="16dp"
                android:visibility="gone"
                app:cardCornerRadius="16dp"
                app:cardElevation="2dp"
                app:layout_constraintBottom_toBottomOf="parent"
                app:layout_constraintEnd_toEndOf="parent"
                app:layout_constraintStart_toStartOf="parent"
                app:layout_constraintTop_toBottomOf="@id/inputCard"
                app:strokeColor="#64B5F6"
                app:strokeWidth="1dp">

                <LinearLayout
                    android:layout_width="match_parent"
                    android:layout_height="wrap_content"
                    android:orientation="vertical"
                    android:padding="20dp">

                    <TextView
                        android:id="@+id/sequenceTitle"
                        android:layout_width="wrap_content"
                        android:layout_height="wrap_content"
                        android:text="Selected Sequence"
                        android:textAppearance="?attr/textAppearanceHeadline6"
                        android:textStyle="bold" />

                    <View
                        android:layout_width="40dp"
                        android:layout_height="3dp"
                        android:layout_marginTop="8dp"
                        android:background="#64B5F6" />

                    <TextView
                        android:id="@+id/formulaText"
                        android:layout_width="wrap_content"
                        android:layout_height="wrap_content"
                        android:layout_marginTop="16dp"
                        android:text="Formula will appear here"
                        android:textAppearance="?attr/textAppearanceBody2"
                        android:textStyle="italic" />

                    <TextView
                        android:id="@+id/requirementText"
                        android:layout_width="wrap_content"
                        android:layout_height="wrap_content"
                        android:layout_marginTop="12dp"
                        android:background="@drawable/requirement_background"
                        android:paddingHorizontal="12dp"
                        android:paddingVertical="6dp"
                        android:textAppearance="?attr/textAppearanceCaption"
                        android:textColor="@color/black"
                        android:visibility="gone" />

                    <View
                        android:layout_width="match_parent"
                        android:layout_height="1dp"
                        android:layout_marginTop="16dp"
                        android:layout_marginBottom="16dp"
                        android:background="#20000000" />

                    <TextView
                        android:layout_width="wrap_content"
                        android:layout_height="wrap_content"
                        android:text="Results"
                        android:textAppearance="?attr/textAppearanceSubtitle1"
                        android:textStyle="bold" />

                    <ScrollView
                        android:layout_width="match_parent"
                        android:layout_height="wrap_content"
                        android:layout_marginTop="8dp"
                        android:maxHeight="200dp">

                        <TextView
                            android:id="@+id/sequenceResult"
                            android:layout_width="match_parent"
                            android:layout_height="wrap_content"
                            android:background="@drawable/result_background"
                            android:fontFamily="monospace"
                            android:padding="12dp"
                            android:textAppearance="?attr/textAppearanceBody1" />
                    </ScrollView>
                </LinearLayout>
            </com.google.android.material.card.MaterialCardView>

            <ProgressBar
                android:id="@+id/progressBar"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:layout_marginTop="24dp"
                android:visibility="gone"
                app:layout_constraintEnd_toEndOf="parent"
                app:layout_constraintStart_toStartOf="parent"
                app:layout_constraintTop_toBottomOf="@id/inputCard" />

        </androidx.constraintlayout.widget.ConstraintLayout>
    </androidx.core.widget.NestedScrollView>

</androidx.coordinatorlayout.widget.CoordinatorLayout>
