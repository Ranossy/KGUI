---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����/������Ⱥ_������Ӱ��ʧʱ��ɢ����.lua
-- ����ʱ��:	2017/4/15 21:44:16
-- �����û�:	XIAXIANBO1
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �����ؼ�
-- ������    :  ֣����
-- ����ʱ��  :  20110908
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData =
{

};

function UnApply(dwCharacterID)
	local playerA = GetPlayer(dwCharacterID)
	if not playerA then
		return
	end

	local scene = playerA.GetScene()
	if not scene then
		return
	end

	--if scene.bIsArenaMap then
		--playerA.SetTimer(8, "scripts/skill/����/����/������Ⱥ_������Ӱ��ʧʱ��ɢ����.lua", 0, 0)
	--end

	playerA.DelBuff(7158, 1)
	playerA.DelBuff(3274, 1)
	playerA.DelBuff(3274, 2)
	playerA.DelBuff(3443, 1)

	--����ʿ״̬͸������ʾ
	if playerA.GetBuff(10827, 1) then
		playerA.AddBuff(playerA.dwID, playerA.nLevel, 11494, 1, 30)
	end

	--[[
	local scene = playerA.GetScene()
	if not scene then
		return
	end

	if scene.bIsArenaMap then
		local playerlist = scene.GetAllPlayer()
		for i = 1, #playerlist do
			local playerOB = GetPlayer(playerlist[i])
			if playerOB and playerOB.GetBuff(10709, 0) then
				RemoteCallToClient(playerOB.dwID, "CallUIGlobalFunction", "FireUIEvent", "ON_PLAYER_HIDE", tplayer.dwID, false)
			end
		end
	end
	]]

	--��Ѩ��������
	if playerA.GetSkillLevel(6457) == 1 then
		playerA.AddBuff(dwCharacterID, playerA.nLevel, 9073, 1, 6)
	end
	--print(6767)
	local buff = playerA.GetBuff(5785, 1)
	playerA.DelGroupBuff(5784, 1)
	if not buff then
		--print(6868)
		return
	end
	local n = buff.nStackNum
	playerA.AddBuff(dwCharacterID, playerA.nLevel, 5786, 1, n)
	playerA.DelGroupBuff(5784, 1)
	playerA.DelGroupBuff(5785, 1)
	playerA.AddBuff(dwCharacterID, playerA.nLevel, 5948, 1, 1)
end
function Apply(dwCharacterID)
end

function OnTimer(player, nP1, nP2)
	--if nP1 == 0 then
		--player.SetTimer(16,"scripts/skill/����/����/������Ⱥ_������Ӱ��ʧʱ��ɢ����.lua",1,0)
	--end
	--SyncCompetitorSkillList(player.dwID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com