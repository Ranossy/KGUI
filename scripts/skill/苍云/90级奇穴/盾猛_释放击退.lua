---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/����_�ͷŻ���.lua
-- ����ʱ��:	2014/10/9 22:18:06
-- �����û�:	zhouyixiao2
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetSkillLevel(13414) == 1 then -- ������Ѻ����Ŀ��
		player.CastSkill(13101, 1, player.GetSkillTarget())
	else
		player.CastSkill(13579, 1, player.GetSkillTarget())
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com