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
	--print(nbuffcount)
	local nbuffcount = nStackNum
	if nbuffcount ~= 0 and not target.GetBuff(3851, 1)	then
		--print(555555555555555555)
		target.AddBuff(0, 99, 9378, 1, nbuffcount)
	end
end;

function OnDetach(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum)

end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com