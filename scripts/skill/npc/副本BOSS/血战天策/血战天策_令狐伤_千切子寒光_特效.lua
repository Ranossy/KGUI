---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/Ѫս���/Ѫս���_�����_ǧ���Ӻ���_��Ч.lua
-- ����ʱ��:	2014/4/3 12:25:52
-- �����û�:	xueyan-pc
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  �ź�
-- ����ʱ��	:  2013-10-16
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local nTime = 8
	local nBuff1 = player.GetBuff(7207, 1)
	if nBuff1 then
		nBuff1.nCustomValue = player.nZ
		nTime = 16
	end
	local nBuff2 = player.GetBuff(7207, 2)
	if nBuff2 then
		nBuff2.nCustomValue = player.nZ
		nTime = 16
	end
	local nBuff3 = player.GetBuff(7207, 3)
	if nBuff3 then
		nBuff3.nCustomValue = player.nZ
		nTime = 16
	end
	local nBuff4 = player.GetBuff(7207, 4)
	if nBuff4 then
		nBuff4.nCustomValue = player.nZ
		nTime = 16
	end

	player.SetTimer(nTime, "scripts/skill/npc/����BOSS/Ѫս���/Ѫս���_�����_ǧ���Ӻ���_��Ч.lua", player.nX, player.nY)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)				-- һ��ʱ�����Ч
	local nBuff1 = player.GetBuff(7207, 1)
	local nBuff2 = player.GetBuff(7207, 2)
	local nBuff3 = player.GetBuff(7207, 3)
	local nBuff4 = player.GetBuff(7207, 4)
	local scene = player.GetScene()
	if not scene then
		return
	end
	local npc = scene.GetNpcByNickName("linghushang")
	if not npc then
		return
	end
	if nBuff1 then
		npc.CastSkillXYZ(8311, 1, nParam1, nParam2, nBuff1.nCustomValue)
		player.DelBuff(7207, 1)
		player.PlaySfx(626, nParam1, nParam2, nBuff1.nCustomValue)
	end
	if nBuff2 then
		npc.CastSkillXYZ(8311, 2, nParam1, nParam2, nBuff2.nCustomValue)
		player.DelBuff(7207, 2)
		player.PlaySfx(626, nParam1, nParam2, nBuff2.nCustomValue)
	end
	if nBuff3 then
		npc.CastSkillXYZ(8311, 3, nParam1, nParam2, nBuff3.nCustomValue)
		player.DelBuff(7207, 3)
		player.PlaySfx(626, nParam1, nParam2, nBuff3.nCustomValue)
		--player.AddBuff(0, 99, 6964, 3)
		--player.AddBuff(0,99,7207,3)
	end
	if nBuff4 then
		npc.CastSkillXYZ(8311, 4, nParam1, nParam2, nBuff4.nCustomValue)
		player.DelBuff(7207, 4)
		player.PlaySfx(626, nParam1, nParam2, nBuff4.nCustomValue)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com