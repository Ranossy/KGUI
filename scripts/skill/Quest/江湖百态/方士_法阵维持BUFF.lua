---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/江湖百态/方士_法阵维持BUFF.lua
-- 更新时间:	2016/7/9 16:31:47
-- 更新用户:	wangwei2
-- 脚本说明:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	if nLeftFrame == 0 then   --自然结束才会播放动作
		local new_ghost = GetNpc(nCharacterID)
		if new_ghost then
			new_ghost.Die()
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com