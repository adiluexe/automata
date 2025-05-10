package com.example.automa_cs_study;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ProgressBar;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.google.android.material.button.MaterialButton;
import com.google.android.material.textfield.TextInputEditText;
import com.google.android.material.textfield.TextInputLayout;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

public class MainActivity extends AppCompatActivity {

    private TextInputEditText numberInput;
    private TextInputLayout inputLayout;
    private TextInputLayout secondInputLayout;
    private TextInputEditText secondNumberInput;
    private TextView sequenceTitle, formulaText, requirementText, sequenceResult;
    private MaterialButton generateButton;
    private RadioGroup sequenceGroup;
    private CardView resultCard;
    private ProgressBar progressBar;
    private final Handler mainHandler = new Handler(Looper.getMainLooper());
    private final Executor backgroundExecutor = Executors.newSingleThreadExecutor();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Initialize UI elements
        numberInput = findViewById(R.id.numberInput);
        inputLayout = findViewById(R.id.inputLayout);
        secondInputLayout = findViewById(R.id.secondInputLayout);
        secondNumberInput = findViewById(R.id.secondNumberInput);
        sequenceTitle = findViewById(R.id.sequenceTitle);
        formulaText = findViewById(R.id.formulaText);
        requirementText = findViewById(R.id.requirementText);
        sequenceResult = findViewById(R.id.sequenceResult);
        generateButton = findViewById(R.id.generateButton);
        sequenceGroup = findViewById(R.id.sequenceGroup);
        resultCard = findViewById(R.id.resultCard);
        progressBar = findViewById(R.id.progressBar);

        // Set up toolbar

        // Clear initial result text
        sequenceResult.setText("");

        // Set initial radio button selection
        RadioButton fibonacciOption = findViewById(R.id.fibonacciOption);
        fibonacciOption.setChecked(true);
        updateFormulaText(R.id.fibonacciOption);

        // Add radio button listener to update formula text
        sequenceGroup.setOnCheckedChangeListener((group, checkedId) -> {
            updateFormulaText(checkedId);
            // Hide result card when selecting a different sequence
            if (resultCard.getVisibility() == View.VISIBLE) {
                resultCard.setVisibility(View.GONE);
            }
        });

        // Set up button click listener
        generateButton.setOnClickListener(view -> {
            // Add button animation effect
            view.animate().scaleX(0.95f).scaleY(0.95f).setDuration(100).withEndAction(() -> {
                view.animate().scaleX(1f).scaleY(1f).setDuration(100);
                validateAndGenerate();
            });
        });
    }

    private void updateFormulaText(int checkedId) {
        if (checkedId == R.id.fibonacciOption) {
            sequenceTitle.setText("Fibonacci Sequence");
            formulaText.setText("F(n) = F(n-1) + F(n-2), with F(0) = 0 and F(1) = 1");
            requirementText.setVisibility(View.VISIBLE);
            requirementText.setText("Requires at least 3 terms");
            inputLayout.setHint("Number of terms");
            secondInputLayout.setVisibility(View.GONE);
        } else if (checkedId == R.id.lucasOption) {
            sequenceTitle.setText("Lucas Sequence");
            formulaText.setText("L(n) = L(n-1) + L(n-2), with L(0) = 2 and L(1) = 1");
            requirementText.setVisibility(View.GONE);
            inputLayout.setHint("Number of terms");
            secondInputLayout.setVisibility(View.GONE);
        } else if (checkedId == R.id.tribonacciOption) {
            sequenceTitle.setText("Tribonacci Sequence");
            formulaText.setText("T(n) = T(n-1) + T(n-2) + T(n-3), with T(0) = 0, T(1) = 1, T(2) = 1");
            requirementText.setVisibility(View.VISIBLE);
            requirementText.setText("Requires at least 4 terms");
            inputLayout.setHint("Number of terms");
            secondInputLayout.setVisibility(View.GONE);
        } else if (checkedId == R.id.collatzOption) {
            sequenceTitle.setText("Collatz Sequence");
            formulaText.setText("If n is even: n → n/2\nIf n is odd: n → 3n+1\nStarting with your input number");
            requirementText.setVisibility(View.GONE);
            inputLayout.setHint("Starting number");
            secondInputLayout.setVisibility(View.GONE);
        } else if (checkedId == R.id.euclideanOption) {
            sequenceTitle.setText("Euclidean Algorithm");
            formulaText.setText("GCD(a,b) = GCD(b, a mod b) until b = 0");
            requirementText.setVisibility(View.GONE);
            inputLayout.setHint("First number (a)");
            secondInputLayout.setVisibility(View.VISIBLE);
            secondInputLayout.setHint("Second number (b)");
        }
    }

    private void validateAndGenerate() {
        String input = numberInput.getText().toString().trim();
        if (input.isEmpty()) {
            Toast.makeText(this, "Please enter a number", Toast.LENGTH_SHORT).show();
            return;
        }

        int n;
        try {
            n = Integer.parseInt(input);
            if (n <= 0) {
                Toast.makeText(this, "Please enter a positive number", Toast.LENGTH_SHORT).show();
                return;
            }

            // Add validation for minimum terms requirement
            int checkedId = sequenceGroup.getCheckedRadioButtonId();
            if (checkedId == R.id.fibonacciOption && n < 3) {
                Toast.makeText(this, "Fibonacci sequence requires at least 3 terms", Toast.LENGTH_SHORT).show();
                return;
            } else if (checkedId == R.id.tribonacciOption && n < 4) {
                Toast.makeText(this, "Tribonacci sequence requires at least 4 terms", Toast.LENGTH_SHORT).show();
                return;
            }

            // Add validation for Euclidean Algorithm
            if (checkedId == R.id.euclideanOption) {
                String secondInput = secondNumberInput.getText().toString().trim();
                if (secondInput.isEmpty()) {
                    Toast.makeText(this, "Please enter the second number", Toast.LENGTH_SHORT).show();
                    return;
                }
                try {
                    int secondN = Integer.parseInt(secondInput);
                    if (secondN <= 0) {
                        Toast.makeText(this, "Please enter a positive second number", Toast.LENGTH_SHORT).show();
                        return;
                    }
                } catch (NumberFormatException e) {
                    Toast.makeText(this, "Invalid second number format", Toast.LENGTH_SHORT).show();
                    return;
                }
            }
        } catch (NumberFormatException e) {
            Toast.makeText(this, "Invalid number format", Toast.LENGTH_SHORT).show();
            return;
        }

        // Hide result card and show progress indicator
        resultCard.setVisibility(View.GONE);
        progressBar.setVisibility(View.VISIBLE);

        // Simulate calculation delay and generate sequence in background
        final int finalN = n;
        backgroundExecutor.execute(() -> {
            String result = "";

            // Generate the selected sequence
            int checkedId = sequenceGroup.getCheckedRadioButtonId();
            if (checkedId == R.id.fibonacciOption) {
                result = generateFibonacci(finalN);
            } else if (checkedId == R.id.lucasOption) {
                result = generateLucas(finalN);
            } else if (checkedId == R.id.tribonacciOption) {
                result = generateTribonacci(finalN);
            } else if (checkedId == R.id.collatzOption) {
                result = generateCollatz(finalN);
            } else if (checkedId == R.id.euclideanOption) {
                result = generateEuclidean(finalN);
            }

            // Simulate processing time
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            String finalResult = result;
            mainHandler.post(() -> {
                // Update UI on main thread
                sequenceResult.setText(finalResult);
                progressBar.setVisibility(View.GONE);

                // Show result card with animation
                resultCard.setVisibility(View.VISIBLE);
                Animation slideUp = AnimationUtils.loadAnimation(this, R.anim.slide_in_up);
                resultCard.startAnimation(slideUp);
            });
        });
    }

    private String generateFibonacci(int n) {
        List<String> steps = new ArrayList<>();

        steps.add("Generating Fibonacci Sequence for " + n + " terms");

        // Initialize first two Fibonacci numbers
        int a = 0, b = 1;
        steps.add("Starting with F(0) = 0, F(1) = 1");

        // Show the first two terms
        List<Integer> sequence = new ArrayList<>();
        sequence.add(a);
        sequence.add(b);

        // Generate remaining sequence
        for (int i = 2; i < n; i++) {
            int next = a + b;
            steps.add("F(" + i + ") = " + a + " + " + b + " = " + next);
            sequence.add(next);
            a = b;
            b = next;
        }

        // Result summary
        steps.add("\nFirst " + n + " Fibonacci numbers:");
        steps.add(formatSequence(sequence));

        return String.join("\n", steps);
    }

    private String generateLucas(int n) {
        List<String> steps = new ArrayList<>();

        steps.add("Generating Lucas Sequence for " + n + " terms");

        // Initialize first two Lucas numbers
        int a = 2, b = 1;
        steps.add("Starting with L(0) = 2, L(1) = 1");

        // Show the first two terms
        List<Integer> sequence = new ArrayList<>();
        sequence.add(a);
        sequence.add(b);

        // Generate remaining sequence
        for (int i = 2; i < n; i++) {
            int next = a + b;
            steps.add("L(" + i + ") = " + a + " + " + b + " = " + next);
            sequence.add(next);
            a = b;
            b = next;
        }

        // Result summary
        steps.add("\nFirst " + n + " Lucas numbers:");
        steps.add(formatSequence(sequence));

        return String.join("\n", steps);
    }

    private String generateTribonacci(int n) {
        List<String> steps = new ArrayList<>();

        steps.add("Generating Tribonacci Sequence for " + n + " terms");

        // Initialize first three Tribonacci numbers
        int a = 0, b = 1, c = 1;
        steps.add("Starting with T(0) = 0, T(1) = 1, T(2) = 1");

        // Show the first three terms
        List<Integer> sequence = new ArrayList<>();
        sequence.add(a);
        sequence.add(b);
        sequence.add(c);

        // Generate remaining sequence
        for (int i = 3; i < n; i++) {
            int next = a + b + c;
            steps.add("T(" + i + ") = " + a + " + " + b + " + " + c + " = " + next);
            sequence.add(next);
            a = b;
            b = c;
            c = next;
        }

        // Result summary
        steps.add("\nFirst " + n + " Tribonacci numbers:");
        steps.add(formatSequence(sequence));

        return String.join("\n", steps);
    }

    private String generateCollatz(int n) {
        List<String> steps = new ArrayList<>();
        steps.add("Generating Collatz Sequence starting with " + n);

        // Generate sequence
        List<Integer> sequence = new ArrayList<>();
        int current = n;
        sequence.add(current);

        int displayLimit = 15; // Show detailed steps for first 15 iterations
        int step = 0;

        while (current != 1) {
            int next;
            if (current % 2 == 0) {
                next = current / 2;
                // Only show detailed steps for the first few iterations
                if (step < displayLimit) {
                    steps.add("Step " + step + ": " + current + " is even → " + current + "/2 = " + next);
                }
            } else {
                next = 3 * current + 1;
                if (step < displayLimit) {
                    steps.add("Step " + step + ": " + current + " is odd → 3×" + current + "+1 = " + next);
                }
            }
            current = next;
            sequence.add(current);
            step++;

            // If we've gone past the display limit, add a note
            if (step == displayLimit && current != 1) {
                steps.add("... (remaining steps omitted for brevity) ...");
            }

            // Safety check
            if (sequence.size() > 1000) {
                steps.add("Sequence truncated after 1000 iterations");
                break;
            }
        }

        // Result summary
        steps.add("\nCollatz sequence steps: " + step);
        steps.add("Total terms: " + sequence.size());

        // Show first few and last few terms
        List<Integer> displaySequence = new ArrayList<>();
        if (sequence.size() <= 30) {
            displaySequence = sequence;
        } else {
            // Show first 15 and last 15 terms
            for (int i = 0; i < 15; i++) {
                displaySequence.add(sequence.get(i));
            }
            displaySequence.add(-1); // Marker for ellipsis
            for (int i = sequence.size() - 15; i < sequence.size(); i++) {
                displaySequence.add(sequence.get(i));
            }
        }

        steps.add("\nSequence:");
        steps.add(formatCollatzSequence(displaySequence));

        return String.join("\n", steps);
    }

    private String formatCollatzSequence(List<Integer> sequence) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < sequence.size(); i++) {
            if (sequence.get(i) == -1) {
                sb.append("...");
            } else {
                sb.append(sequence.get(i));
            }

            if (i < sequence.size() - 1 && sequence.get(i) != -1 && sequence.get(i + 1) != -1) {
                sb.append(", ");
            }

            // Add a line break every 5 numbers for better readability
            if ((i + 1) % 5 == 0 && i < sequence.size() - 1) {
                sb.append("\n");
            }
        }
        return sb.toString();
    }

    private String generateEuclidean(int n) {
        List<String> steps = new ArrayList<>();

        // Use the input values from the user
        int a = Integer.parseInt(numberInput.getText().toString().trim());
        int b = Integer.parseInt(secondNumberInput.getText().toString().trim());

        // Store original values to display at the end
        int originalA = a;
        int originalB = b;

        steps.add("Finding GCD of " + a + " and " + b);

        // Track each step of the algorithm
        while (b != 0) {
            int quotient = a / b;
            int remainder = a % b;

            steps.add(a + " = " + b + " × " + quotient + " + " + remainder);

            // Update values for next iteration
            a = b;
            b = remainder;
        }

        // Add the final result
        steps.add("\nGCD(" + originalA + ", " + originalB + ") = " + a);

        return String.join("\n", steps);
    }

    private String formatSequence(List<Integer> sequence) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < sequence.size(); i++) {
            sb.append(sequence.get(i));
            if (i < sequence.size() - 1) {
                sb.append(", ");
            }
            // Add a line break every 5 numbers for better readability
            if ((i + 1) % 5 == 0 && i < sequence.size() - 1) {
                sb.append("\n");
            }
        }
        return sb.toString();
    }

}
