---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��·���Ӽ���/���˺��ӳٴ���buff.lua
-- ����ʱ��:	2015/8/6 15:28:22
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��·���Ӽ���/�����˺�����ɢ���Ĭ.lua
-- ����ʱ��:	2015/8/5 23:00:36
-- �����û�:	mengxiangfei11
-- �ű�˵��:
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)

	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	--[[
	if player.GetSkillLevel(14351) == 1 then
		player.ForgetSkill(14351)
	end
	--]]
end;

function OnDetach(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum)

end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com