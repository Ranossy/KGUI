---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����/����-����ӰӰ�������ж�.lua
-- ����ʱ��:	2016/1/8 12:06:39
-- �����û�:	mantong2
-- �ű�˵��:
----------------------------------------------------------------------<
Include("scripts/player/PlayerDeath.lua")

-- �����¼�����)
function OnDeath(npc, killer)
	--print(22222)
	local player = npc.GetEmployer()
	
	--if (player.GetScene().dwMapID ~= npc.GetScene().dwMapID) or (player.GetScene().dwID ~= npc.GetScene().dwID) then
		player.SetPosition(npc.nX, npc.nY, npc.nZ)
		--ɾ�����������buff�������л�״̬
		--player.DelBuff(9506, 1)	--ɾ���л�ͼ��buff
		player.DelBuff(9691, 1)	--ɾ���ٱ��ϱ���buff
		player.DelBuff(9695, 1)	--ɾ�������������ն�buff
		player.DelBuff(10014, 1)	--��������
		player.DelBuff(10015, 1)	--�˺�ת��
		--�л�����������̬
		player.AddBuff(player.dwID, player.nLevel, 9692, 1)
		--ɾ��Ӱ��
		--player.BreakOTSkill()
		player.CastSkill(15069, 1)
		--print(killer.dwID)
		player.DieByKiller(killer.dwID)
		ProcessFoeKill(player, killer)
		--npc.DelBuff(9697, 1)
		--npc.SetDisappearFrames(1, 0)
	--end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com