-- 成就表, 列出了完成成就需要的道具, Key 是道具索引ID, 即 dwIndex
tItemAcquireAchievementList = {
    [4503] = {nType = ITEM_TABLE_TYPE.OTHER, nAmount = 1, dwAchievementID = 580},
}

-- 套装成就表，装备了一套套装完成该成就,类似下面的填表就可以了
tEquipAchievementIDList = 
{
	[139] =	--少林的第一套门派装（成就ID 139）
		{
			[EQUIPMENT_INVENTORY.BANGLE] = 107, --皈依护手
			[EQUIPMENT_INVENTORY.HELM] = 266, --皈依华冠
			[EQUIPMENT_INVENTORY.CHEST] = 425, --皈依上衫
			[EQUIPMENT_INVENTORY.PANTS] = 616, --皈依长裤
			[EQUIPMENT_INVENTORY.BOOTS] = 808, --皈依僧履
			[EQUIPMENT_INVENTORY.WAIST] = 984, --皈依束腰
		},
		
	[133] = --天策第一套门派装（成就ID 133）
		{
			[EQUIPMENT_INVENTORY.BANGLE] = 111, --曜武护手
			[EQUIPMENT_INVENTORY.HELM] = 270, --曜武胄
			[EQUIPMENT_INVENTORY.CHEST] = 429, --曜武铠
			[EQUIPMENT_INVENTORY.PANTS] = 620, --曜武甲
			[EQUIPMENT_INVENTORY.BOOTS] = 812, --曜武靴
			[EQUIPMENT_INVENTORY.WAIST] = 988, --曜武护带		
		},

	[137] = --七秀第一套门派装（成就ID 137）
		{
			[EQUIPMENT_INVENTORY.BANGLE] = 112, --轻罗护腕
			[EQUIPMENT_INVENTORY.HELM] = 271, --轻罗钗
			[EQUIPMENT_INVENTORY.CHEST] = 430, --轻罗衫
			[EQUIPMENT_INVENTORY.PANTS] = 621, --轻罗裙
			[EQUIPMENT_INVENTORY.BOOTS] = 813, --轻罗绣鞋
			[EQUIPMENT_INVENTORY.WAIST] = 989, --轻罗丝带
		},
		
	[135] = --万花第一套门派装（成就ID 135）
		{
			[EQUIPMENT_INVENTORY.BANGLE] = 108, --半夏护腕
			[EQUIPMENT_INVENTORY.HELM] = 267, --半夏帽
			[EQUIPMENT_INVENTORY.CHEST] = 426, --半夏衣
			[EQUIPMENT_INVENTORY.PANTS] = 617, --半夏长裤
			[EQUIPMENT_INVENTORY.BOOTS] = 809, --半夏鞋
			[EQUIPMENT_INVENTORY.WAIST] = 985, --半夏腰带
		},
		
	[646] = --纯阳第一套门派装（成就ID 141）目标ID 646
		{
			[EQUIPMENT_INVENTORY.BANGLE] = 109, --金虚问道护手
			[EQUIPMENT_INVENTORY.HELM] = 268,--金虚问道巾
			[EQUIPMENT_INVENTORY.CHEST] = 427,--金虚问道袍
			[EQUIPMENT_INVENTORY.PANTS] = 618,--金虚问道裤
			[EQUIPMENT_INVENTORY.BOOTS] = 810,--金虚问道鞋
			[EQUIPMENT_INVENTORY.WAIST] = 986,--金虚问道玉带
		},

	[699] = --纯阳第一套门派装（成就ID 141）目标ID 699
		{
			[EQUIPMENT_INVENTORY.BANGLE] = 110,--清虚修真护手
			[EQUIPMENT_INVENTORY.HELM] = 269,--清虚修真冠
			[EQUIPMENT_INVENTORY.CHEST] = 428,--清虚修真袍
			[EQUIPMENT_INVENTORY.PANTS] = 619,--清虚修真裳
			[EQUIPMENT_INVENTORY.BOOTS] = 811,--清虚修真鞋
			[EQUIPMENT_INVENTORY.WAIST] = 987,--清虚修真玉带
		},
		
}

tEquipAchievementItemList = {}
local AddEquipAchievement = function(dwAchievementID, t)
	t[EQUIPMENT_INVENTORY.TOTAL] = dwAchievementID
	for k, v in pairs(t) do
		tEquipAchievementItemList[v] = t
	end
end

for k, v in pairs(tEquipAchievementIDList) do
	AddEquipAchievement(k, v)
end

tEquipQualityList = 
{
	[EQUIPMENT_INVENTORY.MELEE_WEAPON] = true,
	[EQUIPMENT_INVENTORY.CHEST] = true,
	[EQUIPMENT_INVENTORY.HELM] = true,
	[EQUIPMENT_INVENTORY.PANTS] = true,
	[EQUIPMENT_INVENTORY.BOOTS] = true,
	[EQUIPMENT_INVENTORY.BANGLE] = true,
	[EQUIPMENT_INVENTORY.WAIST] = true,
}

function IsAllEquipQuality(player, nQuality)
	for k, v in pairs(tEquipQualityList) do
		local item = player.GetItem(INVENTORY_INDEX.EQUIP, k)
		if not item or item.nQuality ~= nQuality then
			return false
		end
	end
	return true
end

function IsAllEquipLevel(player, nLevel)
	for k, v in pairs(tEquipQualityList) do
		local item = player.GetItem(INVENTORY_INDEX.EQUIP, k)
		if not item or item.nLevel < nLevel then
			return false
		end
	end
	return true
end


 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com