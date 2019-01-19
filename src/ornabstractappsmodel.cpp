#include "ornabstractappsmodel.h"
#include "ornapplistitem.h"
#include "ornpm.h"

OrnAbstractAppsModel::OrnAbstractAppsModel(bool fetchable, QObject *parent)
    : OrnAbstractListModel(fetchable, parent)
{
    connect(OrnPm::instance(), &OrnPm::packageStatusChanged,
            this, &OrnAbstractAppsModel::onPackageStatusChanged);
}

void OrnAbstractAppsModel::onPackageStatusChanged(const QString &packageName, int status)
{
    Q_UNUSED(status)

    auto size = mData.size();
    for (size_t i = 0; i < size; ++i)
    {
        if (mData[i].package == packageName)
        {
            auto ind = this->createIndex(i, 0);
            emit this->dataChanged(ind, ind, {PackageStatusRole});
            return;
        }
    }
}

QVariant OrnAbstractAppsModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
    {
        return QVariant();
    }

    const auto &app = mData[index.row()];
    switch (role)
    {
    case SortRole:
        return app.title.toLower();
    case ValidityRole:
        return !app.package.isEmpty();
    case PackageStatusRole:
        return OrnPm::instance()->packageStatus(app.package);
    case AppIdRole:
        return app.appId;
    case CreateDateRole:
        return app.created > 0 ? QDateTime::fromMSecsSinceEpoch(qint64(app.created) * 1000).date() :
                                 QDate();
    case RatingCountRole:
        return app.ratingCount;
    case RatingRole:
        return app.rating;
    case TitleRole:
        return app.title;
    case UserNameRole:
        return app.userName;
    case IconSourceRole:
        return app.iconSource;
    case SinceUpdateRole:
        return app.sinceUpdate;
    case CategoryRole:
        return app.category;
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> OrnAbstractAppsModel::roleNames() const
{
    return {
        { ValidityRole,      "isValid" },
        { PackageStatusRole, "packageStatus" },
        { AppIdRole,         "appId" },
        { CreateDateRole,    "createDate" },
        { RatingCountRole,   "ratingCount" },
        { RatingRole,        "rating" },
        { TitleRole,         "title" },
        { UserNameRole,      "userName" },
        { IconSourceRole,    "iconSource" },
        { SinceUpdateRole,   "sinceUpdate" },
        { CategoryRole,      "category" }
    };
}
