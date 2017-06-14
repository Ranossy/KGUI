---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/太原之战_夜守孤城/火龙摧城_持盾buff.lua
-- 更新时间:	2014/7/17 17:49:24
-- 更新用户:	guozhaoxing1
-- 脚本说明:
----------------------------------------------------------------------<

function Apply(dwCharacterID)
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
	--print("持盾UnApply")
	local playerA = GetPlayer(dwCharacterID)
	if playerA and playerA.nMoveState ~= MOVE_STATE.ON_DEATH then
		playerA.DoAction(0, 13243)
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com