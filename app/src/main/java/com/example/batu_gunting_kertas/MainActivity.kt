package com.example.batu_gunting_kertas

import android.os.Bundle
import android.util.Log
import androidx.activity.ComponentActivity

import com.android.volley.Request
import com.android.volley.RequestQueue
import com.android.volley.Response
import com.android.volley.toolbox.JsonObjectRequest
import com.android.volley.toolbox.Volley

class MainActivity : ComponentActivity() {

    private lateinit var requestQueue: RequestQueue

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        requestQueue = Volley.newRequestQueue(this)
        val url = "http://localhost:3000/api/"
        val jsonObjectRequest = JsonObjectRequest(
            Request.Method.GET, url, null,
            Response.Listener { response ->
                Log.d("HTTP Request", "Success: $response")
            },
            Response.ErrorListener { error ->
                Log.e("HTTP Request", "Error: $error")
            }
        )

        requestQueue.add(jsonObjectRequest)
    }
}