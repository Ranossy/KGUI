---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/��_����ָ_����ɢ�ű�.lua
-- ����ʱ��:	2015/7/3 15:39:58
-- �����û�:	mengxiangfei11
-- �ű�˵��:

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum)
	local target = nil
	if IsPlayer(nCharacterID) then
		target = GetPlayer(nCharacterID)
	end

	if not target then
		return
	end

	local nbuffcount = nStackNum * 3
	local nbuffcount_1 = math.floor(nStackNum*1.5)
	
	if target.GetBuff(9173, 1) then
		return
	elseif target.GetBuff(9172, 1) then
		if nbuffcount >= 4 then
			target.AddBuff(0, 99, 9175, 1, nbuffcount_1)
			target.DelBuff(9172, 1)
			target.AddBuff(0, 99, 9173, 1)
		else
			target.AddBuff(0, 99, 9175, 1, nbuffcount)
		end
	else
		target.AddBuff(0, 99, 9175, 1, nbuffcount)
		if nbuffcount >= 4 then
			target.AddBuff(0, 99, 9172, 1)
		end
	end
end;
function OnDetach(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com