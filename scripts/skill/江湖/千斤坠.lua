---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/ǧ��׹.lua
-- ����ʱ��:	2013/9/11 9:50:35
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local nDamageLevel = player.GetSkillLevel(498)
	player.ClearCDTime(193)
	player.CastSkill(499, nDamageLevel)
	player.AddBuff(0, 99, 3473, 2) --��ˤ
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com