package com.indidus.password

import android.app.assist.AssistStructure
import android.os.Build
import android.os.CancellationSignal
import android.service.autofill.AutofillService
import android.service.autofill.Dataset
import android.service.autofill.FillCallback
import android.service.autofill.FillContext
import android.service.autofill.FillRequest
import android.service.autofill.FillResponse
import android.service.autofill.SaveCallback
import android.service.autofill.SaveRequest
import android.view.autofill.AutofillId
import android.view.autofill.AutofillValue
import android.widget.RemoteViews
import androidx.annotation.NonNull
import androidx.annotation.RequiresApi
import com.indidus.password.R
import java.security.KeyStore
import javax.crypto.Cipher

class IndidusPasswordManagerAutofillService : AutofillService() {


    override fun onFillRequest(request: FillRequest, cancellationSignal: CancellationSignal, callback: FillCallback) {
        val contexts = request.fillContexts
        val structure = contexts[contexts.size - 1].structure // Focus on last context

        val packageName = structure.activityComponent?.packageName
        val url = extractUrlHeuristic(structure) // Your URL heuristic function

//        val matchingCredentials = findCredentials(packageName, url)
//
//        if (matchingCredentials != null) {
//            val responseBuilder = FillResponse.Builder()
//
//            matchingCredentials.forEach {
//                val datasetBuilder = Dataset.Builder(buildPresentation(it))
//                    .setId(it.id.toString()) // Assuming 'id' field exists on your credential
//                responseBuilder.addDataset(datasetBuilder.build())
//            }
//
//            callback.onSuccess(responseBuilder.build())
//        } else {
//            callback.onFailure("No matching credentials found")
//        }
    }

    private fun extractUrlHeuristic(structure: AssistStructure): String? {
        val activityComponent = structure.activityComponent
//
//        val x = tryExtractUrlFromViewId(presentation, android.R.id.text1)
//
//        // Priority 1: Explicit URL Fields
//        if (tryExtractUrlFromViewId(presentation, android.R.id.text1) != null) return it
//        if (tryExtractUrlFromViewId(presentation, android.R.id.hint)) return it
//
//        // Priority 2: Text with URL-like Structure
//        val childCount = presentation.getChildCount()
//        for (i in 0 until childCount) {
//            val childView = presentation.getChildAt(i)
//            val potentialUrl = tryExtractUrlFromViewId(childView, android.R.id.text1) ?: continue
//            if (potentialUrl.isValidUrl()) return potentialUrl
//        }

        return null // No URL found
    }

    private fun tryExtractUrlFromViewId(view: RemoteViews, viewId: Int): String? {
        return ""
//        return view.getCharSequence(viewId)?.toString()?.takeIf { it.isValidUrl() }
    }

    private fun String.isValidUrl(): Boolean {
        return true
//        return Patterns.WEB_URL.matcher(this).matches()
    }
//    override fun onFillRequest(
//        request: FillRequest,
//        cancel: CancellationSignal,
//        callback: FillCallback
//    ) {
//        // Get the structure from the request
//        val context: List<FillContext> = request.fillContexts
//        val structure: AssistStructure = context[context.size - 1].structure
//
//        // Traverse the structure looking for nodes to fill out
////        val parsedStructure: ParsedStructure = traverseStructure(structure)
//
//        // Fetch user data that matches the fields
////        val (username: String, password: String) = fetchUserData(parsedStructure)
//        val keyStore = KeyStore.getInstance("AndroidKeyStore")
//        keyStore.load(null) // No password needed for AndroidKeyStore
//        val secretKeyEntry = keyStore.getEntry("key", null) as KeyStore.SecretKeyEntry
//        val retrievedSecretKey = secretKeyEntry.secretKey
//        val cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding")
//        cipher.doFinal()
//        // "RSA/ECB/PKCS1Padding
//        val username = "username"
//        val password = "password"
//    }

    override fun onSaveRequest(
        request: SaveRequest,
        callback: SaveCallback
    ) {
        // Process save request
        // Implement code to handle the save request if needed
    }

    fun traverseStructure(structure: AssistStructure) {
        val windowNodes: List<AssistStructure.WindowNode> =
            structure.run {
                (0 until windowNodeCount).map { getWindowNodeAt(it) }
            }

        windowNodes.forEach { windowNode: AssistStructure.WindowNode ->
            val viewNode: AssistStructure.ViewNode? = windowNode.rootViewNode
            traverseNode(viewNode)
        }
    }

    fun traverseNode(viewNode: AssistStructure.ViewNode?) {
        if (viewNode?.autofillHints?.isNotEmpty() == true) {
            // If the client app provides autofill hints, you can obtain them using
            // viewNode.getAutofillHints();
        } else {
            // Or use your own heuristics to describe the contents of a view
            // using methods such as getText() or getHint()
        }

        val children: List<AssistStructure.ViewNode>? =
            viewNode?.run {
                (0 until childCount).map { getChildAt(it) }
            }

        children?.forEach { childNode: AssistStructure.ViewNode ->
            traverseNode(childNode)
        }
    }

}
