---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/长歌/套路及子技能/持续伤害被驱散延迟buff.lua
-- 更新时间:	2015/8/5 23:20:50
-- 更新用户:	mengxiangfei11
-- 脚本说明:
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)

	local target = nil			--buff作用者，现在是之前那个驱散的人
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
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com