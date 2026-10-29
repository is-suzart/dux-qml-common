pragma ComponentBehavior: Bound

import QtQuick
import qs.DCommon.Common
import qs.DCommon.Widgets

Column {
    id: section

    property string title: ""
    property string iconName: ""
    property string emptyText: ""
    property bool showEmpty: false
    property bool isHiddenSection: false

    signal headerClicked

    default property alias rows: body.data

    spacing: FileBrowserMetrics.sidebarRowGap
    opacity: isHiddenSection ? 0.45 : 1

    Rectangle {
        width: section.width
        height: titleRow.implicitHeight + Style.spacingXS * 2
        color: "transparent"
        radius: Style.cornerRadiusXS

        Row {
            id: titleRow
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: Style.spacingM
            spacing: Style.spacingS

            DIcon {
                anchors.verticalCenter: parent.verticalCenter
                name: section.iconName
                size: Style.iconSizeSmall
                color: Style.primary
                visible: section.iconName !== ""
            }

            StyledText {
                anchors.verticalCenter: parent.verticalCenter
                text: section.title
                color: Style.primary
                font.pixelSize: Style.fontSizeMedium
                font.weight: Style.fontWeightMedium
            }
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: section.headerClicked()
        }
    }

    Column {
        id: body

        width: section.width
        spacing: FileBrowserMetrics.sidebarRowGap
    }

    StyledText {
        width: section.width
        visible: section.showEmpty && section.emptyText !== ""
        text: section.emptyText
        color: Style.surfaceVariantText
        font.pixelSize: Style.fontSizeSmall
        leftPadding: Style.spacingM
        rightPadding: Style.spacingM
        wrapMode: Text.Wrap
    }
}
