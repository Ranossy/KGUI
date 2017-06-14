---------------------------------------------------------------------->
-- 脚本名称:	scripts/Map/天泣林/npc/1号boss/看舞的宝箱.lua
-- 更新时间:	2015/3/6 10:51:51
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<
-- 对话事件函数


-- 死亡事件函数
function OnDeath(npc, killer)
	local scene = npc.GetScene()
	if not scene then
		return
	end
	
	if killer then
		Log("dwNpcTemplateID: " .. npc.dwTemplateID .. ", dwKillerID: " .. killer.dwID .. ", dwDropTargetPlayerID: " .. npc.dwDropTargetPlayerID)
	else
		Log("dwNpcTemplateID: " .. npc.dwTemplateID .. ", killer is nil" .. ", dwDropTargetPlayerID: " .. npc.dwDropTargetPlayerID)
	end
	scene.SetProgress(1, true)
	scene.SaveMap()
	--AddXianRenZhiLuMark(npc)
	--SetTongQuestValue(scene, "看舞")
end

-- 复活事件函数
--function OnNpcRevive(npc)
--end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com