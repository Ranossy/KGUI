---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���׵���_ǧ�׵�/������/������_�ָ�HPBuff.lua
-- ����ʱ��:	2017/3/8 10:58:09
-- �����û�:	CHENGSIHAN
-- �ű�˵��:
----------------------------------------------------------------------<
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
function Apply(dwCharacterID, dwSkillSrcID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	--��Ѫ
	if npc.nCurrentLife >= npc.nMaxLife * 0.995 then
		npc.nCurrentLife = npc.nMaxLife
	else
		npc.nCurrentLife = npc.nCurrentLife + npc.nMaxLife * 0.005
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com