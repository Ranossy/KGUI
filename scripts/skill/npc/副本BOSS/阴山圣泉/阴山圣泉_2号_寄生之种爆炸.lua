---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/阴山圣泉/阴山圣泉_2号_寄生之种爆炸.lua
-- 更新时间:	2015/3/17 14:46:51
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local scene = player.GetScene()
	if not scene then
		return
	end

	local molei = scene.GetNpcByNickName("molei")
	if molei then
		if scene.dwMapID == 204 then
			molei.CastSkill(13792, 1, TARGET.PLAYER, dwCharacterID)
		elseif scene.dwMapID == 227 then
			molei.CastSkill(13792, 2, TARGET.PLAYER, dwCharacterID)
		end
	end
	player.PlaySfx(1121, player.nX, player.nY, player.nZ)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com