---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能道具/烟花1.lua
-- 更新时间:	08/20/09 15:52:33
-- 更新用户:	wujuan
-- 脚本说明:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")

function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
	player.DoAction(0, 10200)
	player.DoCustomOTAction(0, 1, 3 * GLOBAL.GAME_FPS, TARGET.NO_TARGET, 0, 
		"scripts/skill/技能道具/烟花1.lua", GetEditorString(2, 5693))
	return false, false
end
function OnCustomEvent(player)
	local nItemAmount = player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 4838)
	if nItemAmount == 0 then
		player.SendSystemMessage(GetEditorString(2, 2754))
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	local nDis = 2
	local nX = math.floor(math.cos(player.nFaceDirection / 128 * math.pi) * nDis * 64 + player.nX)
	local nY = math.floor(math.sin(player.nFaceDirection / 128 * math.pi) * nDis * 64 + player.nY)
	local doodad = scene.CreateDoodad(1674, nX, nY, player.nZ, player.nFaceDirection, nil, 0, player.dwIdentityVisiableID)
	if doodad then
		doodad.SetDisappearFrames(5 * GLOBAL.GAME_FPS, 0)
	end
	player.CostItem(ITEM_TABLE_TYPE.OTHER, 4838, 1)
	player.AddBuff(0, 99, 1389, 1)
	player.AddAchievementCount(1061, 1)
end


 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com