---------------------------------------------------------------------->
-- 脚本名称:	scripts/DiamondSlotChange/DiamondSlotChange.lua
-- 更新时间:	2015/6/9 10:21:48
-- 更新用户:	mantong2
-- 脚本说明:
----------------------------------------------------------------------<

tCof_Quality = {	--装备品质系数
	[1] = 1,
	[2] = 1.4,
	[3] = 1.6,
	[4] = 1.8,
	[5] = 2.5
}
tCof_Subtype = {	--装备部位系数
	[0] = 1.2,
	[1] = 0.6,
	[2] = 1,
	[3] = 0.9,
	[4] = 0.5,
	[5] = 0.5,
	[6] = 0.7,
	[7] = 0.5,
	[8] = 1,
	[9] = 0.7,
	[10] = 0.7,
}

function Init()
	RegisterResetDiamondSlotCostItem(0, 5, 20553)	--回炼消耗道具注册
end

function CanChangeSlotType(player, item, nSlotIndex)--是否可以修改五行石孔的颜色
	return true
end

function CanChangeSlotAttr(player, item, nSlotIndex)--是否可以修改五行石孔的属性
	return true
end

function CanResetSlotType(player, item, nSlotIndex)--是否可以回炼五行石孔的颜色
	return true
end

function CanResetSlotAttr(player, item, nSlotIndex)--是否可以回炼五行石孔的属性
	return true
end

function ChangeSlotTypeDone(player, item, nSlotIndex)--完成修改五行石孔的颜色
	player.AcquireAchievement(4276)
	local ItemInfo = GetItemInfo(item.dwTabType, item.dwIndex)
	local tIteminfo = ItemInfo.GetSlotAttrib(nSlotIndex)
	local tAchievement = {
		[24] = 4278, -- 火土
		[17] = 4279, -- 土金
		[5] = 4280, -- 金水
		[10] = 4281, -- 木火
		[6] = 4282, -- 水木
	}
	--[[
	if tIteminfo then
		AchievementID = tAchievement[tIteminfo.nMask]
		if AchievementID then
			player.AcquireAchievement(AchievementID)
		end
	end--]]
end

function ChangeSlotAttrDone(player, item, nSlotIndex)--完成修改五行石孔的属性
	player.AcquireAchievement(4275)
end

function ResetSlotTypeDone(player, item, nSlotIndex)--完成回炼五行石孔的颜色

end

function ResetSlotAttrDone(player, item, nSlotIndex)--完成回炼五行石孔的属性

end

function GetResetSlotTypeCostItemCount(player, item, nSlotIndex)
	local nTotalValue = math.max(117 * 4 + (item.nLevel-15) * 400 * tCof_Quality[item.nQuality] * tCof_Subtype[item.nSub] * 130 / 88, 1000)
	local nItemCount1 = math.floor(nTotalValue / 2000 / 30 + 0.5)
	return nItemCount1, 0, 0
end

function GetResetSlotAttrCostItemCount(player, item, nSlotIndex)
	local nTotalValue = math.max(117 * 4 + (item.nLevel-15) * 400 * tCof_Quality[item.nQuality] * tCof_Subtype[item.nSub] * 130 / 88, 1000)
	local nItemCount1 = math.floor(nTotalValue / 2000 / 30 + 0.5)
	return nItemCount1, 0, 0
end

function GetResetSlotTypeCostTrain(player, item, nSlotIndex)
	return 10000
end

function GetResetSlotAttrCostTrain(player, item, nSlotIndex)
	return 10000
end

function GetResetSlotTypeCostMoney(player, item, nSlotIndex)
	return 0
end

function GetResetSlotAttrCostMoney(player, item, nSlotIndex)
	return 0
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com