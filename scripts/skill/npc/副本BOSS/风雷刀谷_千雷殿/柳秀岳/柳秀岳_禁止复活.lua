---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/风雷刀谷_千雷殿/柳秀岳/柳秀岳_禁止复活.lua
-- 更新时间:	2017/3/7 21:33:38
-- 更新用户:	CHENGSIHAN
-- 脚本说明:
----------------------------------------------------------------------<
Include("scripts/Craft/Include/strings.ls")
Include("scripts/Include/Player.lh")
-- 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local scene = player.GetScene()
	if scene then
		local tReviveSetting = player.GetReviveCtrl()
		tReviveSetting.nReviveFrame = tReviveSetting.nReviveFrame + 50 * 60 * GLOBAL.GAME_FPS --设定时间50分钟
		tReviveSetting.nNextCheckReviveFrame = tReviveSetting.nReviveFrame
		player.SetReviveCtrl(tReviveSetting)
		CheckPlayerReviveCommon(player)
	end
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com