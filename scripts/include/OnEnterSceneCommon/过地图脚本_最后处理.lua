---------------------------------------------------------------------->
-- �ű�����:	scripts/Include/OnEnterSceneCommon/����ͼ�ű�_�����.lua
-- ����ʱ��:	2017/3/20 16:35:41
-- �����û�:	zhengfeng6
-- �ű�˵��:
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
	--���������ͬ������������������������û�������ݾͿ�ʼ���У�ע�͵�Ⱥ����¹���а�ͬ��
	--if not IsRemotePlayer(player.dwID) then
	--	RemoteCallToCenter("On_Tong_GetBattleFieldInfoAll", player.dwID, "On_ZhanChang_QWGRankData")
	--end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com