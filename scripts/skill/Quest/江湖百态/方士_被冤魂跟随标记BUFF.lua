---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/江湖百态/方士_被冤魂跟随标记BUFF.lua
-- 更新时间:	2016/6/14 15:57:17
-- 更新用户:	wangwei2
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	------------判断是不是可用场景，0是野外、门派地图-----------
	if scene.nType ~= 0 then
		player.DelBuff(10842, 1)
		return
	end
	--2%的几率给提示,概率低点
	if Random(100000) > 98000 then   
		--RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", "你无端地感到一丝阴冷。", 3)
		player.SendSystemMessage(GetEditorString(10, 1363))
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	if player.dwIdentityVisiableID == 7 then
		player.SetIdentityVisiableID(0)	--回归到正常位面
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com