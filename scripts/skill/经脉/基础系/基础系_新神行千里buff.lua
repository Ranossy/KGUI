---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/经脉/基础系/基础系_新神行千里buff.lua
-- 更新时间:	2013/10/14 19:52:39
-- 更新用户:	meizhu
-- 脚本说明:	
----------------------------------------------------------------------<
local tbTransTurn = {
	[331] = 204,
	[335] = 108,
	[339] = 71,
	[346] = 39,
}
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	
	local nCityID = nCustomValue
	
	if not nCityID then
		return
	end

	--调整落地朝向
	if tbTransTurn[nCityID] then
		player.TurnTo(tbTransTurn[nCityID])
	end
	
	--神行千里专用传送接口
	player.Transmission(nCityID)

	--满级指引任务相关
	local nQuestId = 13906
	local nQuestIndex = player.GetQuestIndex(nQuestId)
	local nQuestPhase = player.GetQuestPhase(nQuestId)
	if nQuestIndex and nQuestPhase == 1 then
		player.SetQuestValue(nQuestIndex, 0, 1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com