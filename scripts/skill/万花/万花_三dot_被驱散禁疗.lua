---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/万花_商阳指_被驱散脚本.lua
-- 更新时间:	2015/7/3 15:39:58
-- 更新用户:	mengxiangfei11
-- 脚本说明:

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
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com