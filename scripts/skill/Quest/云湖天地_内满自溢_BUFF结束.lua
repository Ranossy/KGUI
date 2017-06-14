---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/云湖天地_内满自溢_BUFF结束.lua
-- 更新时间:	2017/1/10 22:08:57
-- 更新用户:	qinfupi
-- 脚本说明:
----------------------------------------------------------------------<

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	if not IsPlayer(nCharacterID) then
		return
	end
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	if nLeftFrame == 0 then
		-- 玩家技能来播放表现。
		player.CastSkill(17260, 1)
		player.CastSkill(7192, 1)		
		-- npc技能来播放逻辑技能
		--local npc = scene.GetNpcByNickName("caster")
		--if npc then
		--npc.CastSkill(7165, 1, TARGET.PLAYER, player.dwID)
		--end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com