---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_����ǹ��_�����������γ��.lua
-- ����ʱ��:	2013/6/7 8:12:52
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
Include("scripts/Include/Skill.lh")

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player.GetKungfuMount().dwSkillID == 10062 then
		--player.AddBuff(dwCharacterID,player.nLevel,6366,1,1)
	end
	
	ModityCDToUI(player, 2628, 0, 0)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com