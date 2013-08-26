import QtQuick 2.0

Rectangle {
    id : container
    width: 100
    height: 35
    color : "#1f262f"

    property bool saveRequired : true

    signal newFile()
    signal openFile()
    signal saveFile()

    signal fontPlus()
    signal fontMinus()

    function questionSave(){
        messageBox.visible = true
    }

    // Logo

    Rectangle{
        anchors.left: parent.left
        anchors.leftMargin: 7
        height : parent.height
        Image{
            anchors.verticalCenter: parent.verticalCenter
            source : "../LiveCVImages/logo.png"
        }
    }

    // New

    Rectangle{
        anchors.left: parent.left
        anchors.leftMargin: 165
        height : parent.height
        width : newImage.width
        color : "transparent"
        Image{
            id : newImage
            anchors.verticalCenter: parent.verticalCenter
            source : "../LiveCVImages/new.png"
        }
        Rectangle{
            color : "#354253"
            width : parent.width
            height : 3
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            visible : newMArea.containsMouse
        }
        MouseArea{
            id : newMArea
            anchors.fill: parent
            hoverEnabled: true
            onClicked: container.newFile()
        }
    }

    // Open

    Rectangle{
        anchors.left: parent.left
        anchors.leftMargin: 195
        color : "transparent"
        height : parent.height
        width : saveImage.width
        Image{
            id : saveImage
            anchors.verticalCenter: parent.verticalCenter
            source : "../LiveCVImages/save.png"
        }
        Rectangle{
            color : "#354253"
            width : parent.width
            height : 3
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            visible : saveMArea.containsMouse
        }
        MouseArea{
            id : saveMArea
            anchors.fill: parent
            hoverEnabled: true
            onClicked: container.saveFile();
        }
    }

    // Save

    Rectangle{
        anchors.left: parent.left
        anchors.leftMargin: 225
        color : "transparent"
        height : parent.height
        width : openImage.width
        Image{
            id : openImage
            anchors.verticalCenter: parent.verticalCenter
            source : "../LiveCVImages/open.png"
        }
        Rectangle{
            color : "#354253"
            width : parent.width
            height : 3
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            visible : openMArea.containsMouse
        }
        MouseArea{
            id : openMArea
            anchors.fill: parent
            hoverEnabled: true
            onClicked: container.openFile()
        }
    }

    // Font Size

    Rectangle{
        anchors.left: parent.left
        anchors.leftMargin: 320
        color : "transparent"
        height : parent.height
        width : 20
        Text{
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            text : "-"
            color : "#bec7ce"
            font.pixelSize: 24
            font.family: "Arial"
        }
        Rectangle{
            color : "#354253"
            width : parent.width
            height : 3
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            visible : minusMArea.containsMouse
        }
        MouseArea{
            id : minusMArea
            anchors.fill: parent
            hoverEnabled: true
            onClicked: container.fontMinus()
        }
    }
    Rectangle{
        anchors.left: parent.left
        anchors.leftMargin: 344
        color : "transparent"
        height : parent.height
        width : 20
        Text{
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            text : "+"
            color : "#bec7ce"
            font.pixelSize: 24
            font.family: "Arial"
        }
        Rectangle{
            color : "#354253"
            width : parent.width
            height : 3
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            visible : plusMArea.containsMouse
        }
        MouseArea{
            id : plusMArea
            anchors.fill: parent
            hoverEnabled: true
            onClicked: container.fontPlus()
        }
    }

    Rectangle{
        id : messageBox
        anchors.left: parent.left
        anchors.leftMargin: 165
        height : parent.height
        color : "#242a34"
        width : 350
        visible : false
        Text{
            color : "#bec7ce"
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            text : "Would you like to save your current code?"
        }
        Rectangle{
            anchors.left: parent.left
            anchors.leftMargin: 250
            height : parent.height
            width : 50
            color : "transparent"
            Text{
                color : yesMArea.containsMouse ? "#fff" : "#bec7ce"
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.verticalCenter: parent.verticalCenter
                text : "Yes"
            }
            MouseArea{
                id : yesMArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked : {
                    messageBox.visible = false
                    container.saveFile()
                }
            }
        }
        Rectangle{
            anchors.left: parent.left
            anchors.leftMargin: 300
            height : parent.height
            width : 50
            color : "transparent"
            Text{
                color : noMArea.containsMouse ? "#fff" : "#bec7ce"
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.verticalCenter: parent.verticalCenter
                text : "No"
            }
            MouseArea{
                id : noMArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked : messageBox.visible = false
            }
        }
    }

}