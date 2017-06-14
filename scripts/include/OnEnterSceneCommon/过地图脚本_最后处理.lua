---------------------------------------------------------------------->
-- 脚本名称:	scripts/Include/OnEnterSceneCommon/过地图脚本_最后处理.lua
-- 更新时间:	2017/3/20 16:35:41
-- 更新用户:	zhengfeng6
-- 脚本说明:
----------------------------------------------------------------------<
Include("scripts/Include/OnEnterSceneCommon/Player_EnterSceneCommon_Include.lua")
function OnEnterSceneCommon_LastAction(player, scene)
	--[[local nFlag = player.GetCustomBoolean(429)
	if not nFlag then
		player.SetCustomBoolean(429, true)
		local nContributionSpace = player.GetContributionRemainSpace()		
		player.AddContributionRemainSpace(math.max(nContributionSpace, 90000 + nContributionSpace / 2) - nContributionSpace)
		local nPrestigeSpace = player.GetPrestigeRemainSpace()
		player.AddPrestigeRemainSpace(math.max(nPrestigeSpace, 90000 + nPrestigeSpace / 2) - nPrestigeSpace)
		
		local nJusticeSpace = player.GetJusticeRemainSpace()
		player.AddJusticeRemainSpace(9000 - nJusticeSpace)
		local nExamPrint = player.GetExamPrintRemainSpace()
		player.AddExamPrintRemainSpace(1000 - nExamPrint)
	end
	--]]
	--齐物阁排行同步，最后处理，以免赛季结算玩家没清完数据就开始排行；注释掉群雄逐鹿排行榜同步
	--if not IsRemotePlayer(player.dwID) then
	--	RemoteCallToCenter("On_Tong_GetBattleFieldInfoAll", player.dwID, "On_ZhanChang_QWGRankData")
	--end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com