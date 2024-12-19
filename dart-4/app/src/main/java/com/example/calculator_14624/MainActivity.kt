package com.example.calculator_14624

import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class MainActivity : AppCompatActivity() {
    private lateinit var txtResult: TextView
    private var firstNumber = 0.0
    private var secondNumber = 0.0
    private var operator = ""
    private var isOperatorPressed = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)

        // Mengatur padding untuk WindowInsets
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        txtResult = findViewById(R.id.txtResult)

        // Inisialisasi tombol angka
        findViewById<Button>(R.id.btn0).setOnClickListener { appendNumber("0") }
        findViewById<Button>(R.id.btn1).setOnClickListener { appendNumber("1") }
        findViewById<Button>(R.id.btn2).setOnClickListener { appendNumber("2") }
        findViewById<Button>(R.id.btn3).setOnClickListener { appendNumber("3") }
        findViewById<Button>(R.id.btn4).setOnClickListener { appendNumber("4") }
        findViewById<Button>(R.id.btn5).setOnClickListener { appendNumber("5") }
        findViewById<Button>(R.id.btn6).setOnClickListener { appendNumber("6") }
        findViewById<Button>(R.id.btn7).setOnClickListener { appendNumber("7") }
        findViewById<Button>(R.id.btn8).setOnClickListener { appendNumber("8") }
        findViewById<Button>(R.id.btn9).setOnClickListener { appendNumber("9") }

        // Inisialisasi tombol operasi
        findViewById<Button>(R.id.btnPlus).setOnClickListener { setOperator("+") }
        findViewById<Button>(R.id.btnMinus).setOnClickListener { setOperator("-") }
        findViewById<Button>(R.id.btnMultiply).setOnClickListener { setOperator("*") }
        findViewById<Button>(R.id.btnDivide).setOnClickListener { setOperator("/") }

        // Tombol sama dengan
        findViewById<Button>(R.id.btnEquals).setOnClickListener { calculateResult() }

        // Tombol clear
        findViewById<Button>(R.id.btnClear).setOnClickListener { clear() }
    }

    private fun appendNumber(number: String) {
        if (isOperatorPressed || txtResult.text.toString() == "0") {
            txtResult.text = number
            isOperatorPressed = false
        } else {
            txtResult.text = txtResult.text.toString() + number
        }
    }

    private fun setOperator(op: String) {
        firstNumber = txtResult.text.toString().toDoubleOrNull() ?: return
        operator = op
        isOperatorPressed = true
    }

    private fun calculateResult() {
        if (operator.isEmpty()) return // Cek apakah operator ada
        secondNumber = txtResult.text.toString().toDoubleOrNull() ?: return

        var result = 0.0

        when (operator) {
            "+" -> result = firstNumber + secondNumber
            "-" -> result = firstNumber - secondNumber
            "*" -> result = firstNumber * secondNumber
            "/" -> result = if (secondNumber != 0.0) {
                firstNumber / secondNumber
            } else {
                txtResult.text = "Error"
                return
            }
        }

        // Cek apakah hasilnya adalah bilangan bulat
        if (result % 1 == 0.0) {
            txtResult.text = result.toInt().toString() // Tampilkan sebagai bilangan bulat
        } else {
            txtResult.text = result.toString() // Tampilkan sebagai bilangan desimal
        }

        firstNumber = result
        isOperatorPressed = true
    }

    private fun clear() {
        txtResult.text = "0"
        firstNumber = 0.0
        secondNumber = 0.0
        operator = ""
        isOperatorPressed = false
    }
}