package per.hojong.baekjoonprofile.view

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun RoundButton(modifier: Modifier?, value: String, onClick: () -> Unit) {
        Button(
            onClick = onClick,
            colors = ButtonDefaults.buttonColors(
                backgroundColor = Color.Black,
            ),
            shape = RoundedCornerShape(8.dp),
            modifier = (modifier ?: Modifier)
                .height(60.dp)
                .aspectRatio(2f)
        ) {
            Text(
                text = value,
                style = MaterialTheme.typography.body1,
                color = Color.White,
            )
        }
}


@Preview(showBackground = true)
@Composable
fun RoundButtonPreview() {
    RoundButton(null, "로그인") {}
}