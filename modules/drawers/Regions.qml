pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Caelestia.Config
import qs.modules.bar as Bar

Region {
    id: root

    required property Bar.BarWrapper bar
    required property Panels panels
    required property var win

    readonly property real borderThickness: win.contentItem.Config.border.thickness
    readonly property real clampedThickness: win.contentItem.Config.border.clampedThickness

    x: clampedThickness + win.dragMaskPadding
    y: clampedThickness + win.dragMaskPadding
    width: win.width - clampedThickness * 2 - win.dragMaskPadding * 2
    height: win.height - bar.clampedHeight - clampedThickness * 2 - win.dragMaskPadding * 2
    intersection: Intersection.Xor

    R {
        id: dashboardRegion
        panel: root.panels.dashboard
        y: 0
        height: panel.offsetScale < 1 ? panel.height * (1 - panel.offsetScale) + root.borderThickness : 0
    }

    R {
        panel: root.panels.launcher
        y: root.win.height - height - root.bar.clampedHeight
        height: panel.offsetScale < 1 ? panel.height * (1 - panel.offsetScale) + root.borderThickness : 0
    }

    R {
        id: sessionRegion
        panel: root.panels.sessionWrapper
    }

    R {
        id: sidebarRegion
        panel: root.panels.sidebar
        width: panel.offsetScale < 1 ? panel.width * (1 - root.panels.sidebar.offsetScale) + root.borderThickness : 0
    }

    R {
        panel: root.panels.osdWrapper
    }

    R {
        panel: root.panels.notifications
        y: 0
        height: panel.height + root.borderThickness
    }

    R {
        panel: root.panels.utilities
        height: panel.offsetScale < 1 ? panel.height * (1 - root.panels.utilities.offsetScale) + root.borderThickness : 0
    }

    R {
        panel: root.panels.popoutsWrapper
        width: panel.width
    }

    component R: Region {
        required property Item panel

        x: panel.x + root.borderThickness
        y: panel.y + root.borderThickness
        width: panel.width
        height: panel.height
        intersection: Intersection.Subtract
    }
}
