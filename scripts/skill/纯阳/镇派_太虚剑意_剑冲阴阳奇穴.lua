---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_̫�齣��_����������Ѩ.lua
-- ����ʱ��:	2013/6/5 10:27:42
-- �����û�:	taoli
-- �ű�˵��:

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")



function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	local target = player.GetSelectCharacter()

	--��Ѩˢ�±��debuff
	if player.GetSkillLevel(6744) == 1 and target then	
		target.AddBuff(dwSkillSrcID, player.nLevel, 2291, 3, 1)
	end
	
	if player.GetSkillLevel(6757) == 1 then
		player.ClearCDTime(438)
	end
	
	ModityCDToUI(player, 2690, 0, 0)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com