import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 10
        Button {
            text: qsTr("Check State")
            onClicked: {
                result.text = "My Name is Kambiz!";
                console.log("Hello, Kambiz!")
            }
        }
        Text {
            id: result
        }
    }

}
