---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���ֺ���/��ֹ����.lua
-- ����ʱ��:	2017/3/9 14:52:41
-- �����û�:	CHENGSIHAN
-- �ű�˵��:
----------------------------------------------------------------------<
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.DelBuff(2313, 1)		--ɾ����˹Ƶ�buff
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com