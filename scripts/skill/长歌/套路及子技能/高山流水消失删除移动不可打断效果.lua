---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��·���Ӽ���/�����˺�����ɢ�ӳ�buff.lua
-- ����ʱ��:	2015/8/5 23:20:50
-- �����û�:	mengxiangfei11
-- �ű�˵��:
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)

	local target = nil			--buff�����ߣ�������֮ǰ�Ǹ���ɢ����
	if IsPlayer(nCharacterID) then
		target = GetPlayer(nCharacterID)
	end

	if not target then
		return
	end

	if target.GetBuff(9497, 1) then
		target.DelBuff(9497, 1)
	end
end;

function OnDetach(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum)

end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com