---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/秦皇陵/秦皇陵_安禄山_拉钩冲刺.lua
-- 更新时间:	2014/2/11 14:58:41
-- 更新用户:	ks13376-PC
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)

end

function UnApply(dwCharacterID)
	
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local npctarget = GetNpc(nCustomValue)
	if npctarget then
		local scene = npctarget.GetScene()
		if scene.dwMapID == 182 then
			npctarget.DelBuff(7416, 1)
		end

		if scene.dwMapID == 183 then
			npctarget.DelBuff(7416, 2)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com