TARGET = harbour-storeman-cn

QT += concurrent dbus core-private
CONFIG += sailfishapp

PKGCONFIG += \
    nemonotifications-qt5 \
    connman-qt5

# Write version file
VERSION_H = \
"$${LITERAL_HASH}ifndef STOREMAN_VERSION" \
"$${LITERAL_HASH}   define STOREMAN_VERSION \"$$VERSION\"" \
"$${LITERAL_HASH}endif"
write_file($$$$OUT_PWD/storeman_version.h, VERSION_H)

CONFIG(release, debug|release): DEFINES += QT_NO_DEBUG_OUTPUT

MOC_DIR = .moc
OBJECTS_DIR = .obj

LIBS += -lsolv

INCLUDEPATH += \
    /usr/include/nemonotifications-qt5 \
    /usr/include/connman-qt5 \
    /usr/include/packagekitqt5/PackageKit \
    /usr/include/PackageKit/packagekit-qt5

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

SOURCES += \
    src/harbour-storeman.cpp \
    src/networkaccessmanagerfactory.cpp \
    src/storeman.cpp \
    src/ornutils.cpp \
    src/ornclient.cpp \
    src/ornabstractappsmodel.cpp \
    src/ornrecentappsmodel.cpp \
    src/ornuserappsmodel.cpp \
    src/orncommentsmodel.cpp \
    src/ornrepomodel.cpp \
    src/ornproxymodel.cpp \
    src/ornapplication.cpp \
    src/ornapplistitem.cpp \
    src/orncommentlistitem.cpp \
    src/ornsearchappsmodel.cpp \
    src/orncategoriesmodel.cpp \
    src/orncategorylistitem.cpp \
    src/orncategoryappsmodel.cpp \
    src/orninstalledappsmodel.cpp \
    src/ornbookmarksmodel.cpp \
    src/ornbackup.cpp \
    src/ornpm.cpp \
    src/ornpackageversion.cpp \
    src/orntagsmodel.cpp \
    src/orntaglistitem.cpp \
    src/orntagappsmodel.cpp

HEADERS += \
    src/networkaccessmanagerfactory.h \
    src/storeman.h \
    src/ornutils.h \
    src/ornclient.h \
    src/ornclient_p.h \
    src/ornabstractlistmodel.h \
    src/ornabstractappsmodel.h \
    src/ornrecentappsmodel.h \
    src/ornuserappsmodel.h \
    src/orncommentsmodel.h \
    src/ornrepomodel.h \
    src/ornproxymodel.h \
    src/ornapplication.h \
    src/ornapplistitem.h \
    src/orncommentlistitem.h \
    src/ornsearchappsmodel.h \
    src/orncategoriesmodel.h \
    src/orncategorylistitem.h \
    src/orncategoryappsmodel.h \
    src/orninstalledappsmodel.h \
    src/ornbookmarksmodel.h \
    src/ornbackup.h \
    src/ornpm.h \
    src/ornpm_p.h \
    src/ornpackageversion.h \
    src/orninstalledpackage.h \
    src/ornrepo.h \
    src/orntagsmodel.h \
    src/orntaglistitem.h \
    src/orntagappsmodel.h

OTHER_FILES += \
    qml/harbour-storeman.qml \
    qml/StoremanStyles.qml \
    qml/cover/CoverPage.qml \
    qml/pages/MainPage.qml \
    qml/pages/RecentAppsPage.qml \
    qml/pages/AppPage.qml \
    qml/pages/RepositoriesPage.qml \
    qml/pages/ScreenshotPage.qml \
    qml/pages/VotingPage.qml \
    qml/pages/ChangelogPage.qml \
    qml/pages/UserAppsPage.qml \
    qml/pages/CommentsPage.qml \
    qml/pages/TagsPage.qml \
    qml/pages/TagAppsPage.qml \
    qml/pages/SearchPage.qml \
    qml/pages/AboutPage.qml \
    qml/pages/TranslationsPage.qml \
    qml/pages/DevelopmentPage.qml \
    qml/pages/CategoriesPage.qml \
    qml/pages/CategoryPage.qml \
    qml/pages/AuthorisationDialog.qml \
    qml/pages/InstalledAppsPage.qml \
    qml/pages/BookmarksPage.qml \
    qml/pages/ErrorPage.qml \
    qml/pages/BackupsPage.qml \
    qml/pages/RestoreDialog.qml \
    qml/pages/BackupDialog.qml \
    qml/pages/SettingsPage.qml \
    qml/pages/MainPageOrderDialog.qml \
    qml/pages/LocalRpmsPage.qml \
    qml/pages/RepoSuggestionPage.qml \
    qml/components/AppListDelegate.qml \
    qml/components/RatingBox.qml \
    qml/components/IconLabel.qml \
    qml/components/FancyPageHeader.qml \
    qml/components/PackageInformation.qml \
    qml/components/AppInformation.qml \
    qml/components/AppInfoLabel.qml \
    qml/components/ScreenshotsBox.qml \
    qml/components/MoreButton.qml \
    qml/components/MainPageButton.qml \
    qml/components/MainPageAppGridDelegate.qml \
    qml/components/AppPageMenu.qml \
    qml/components/RefreshMenuItem.qml \
    qml/components/ParticipantsDelegate.qml \
    qml/components/CommentDelegate.qml \
    qml/components/CommentField.qml \
    qml/components/CommentLabel.qml \
    qml/components/HtmlTagButton.qml \
    qml/components/ListMenuItem.qml \
    qml/components/BookmarkButton.qml \
    qml/components/MenuStatusLabel.qml \
    qml/components/MenuSearchItem.qml \
    qml/components/StoremanTapHint.qml \
    qml/components/StoremanHintLabel.qml \
    qml/components/StoremanTouchInteractionHint.qml \
    qml/components/TagDelegate.qml \
    qml/components/DisappearAnimation.qml \
    qml/components/BackupLabel.qml \
    qml/components/BackupOptions.qml \
    qml/models/DevelopersModel.qml \
    qml/models/TranslatorsModel.qml \
    qml/models/DummyCommentsModel.qml

OTHER_FILES += \
    scripts/update_categories.py \
    rpm/harbour-storeman-cn.changes \
    rpm/harbour-storeman-cn.spec \
    rpm/harbour-storeman-cn.yaml \
    icons/harbour-storeman-cn.svg \
    .gitignore

privileges.files = rpm/harbour-storeman-cn
privileges.path = $$INSTALL_ROOT/usr/share/mapplauncherd/privileges.d/

dbus.files = rpm/harbour.storeman.cn.service
dbus.path = $$INSTALL_ROOT/usr/share/dbus-1/services

INSTALLS += privileges dbus

include(translations/translations.pri)

DISTFILES += \
    harbour-storeman-cn.desktop
