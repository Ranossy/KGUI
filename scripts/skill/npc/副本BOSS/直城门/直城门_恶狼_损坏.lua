------------------------------------------------
-- 创建人   :  张豪	
-- 创建时间	:  2013-8-23
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	npc.AddBuff(0, 99, 6600, 1)
	local scene = npc.GetScene()
	if not scene then
		return
	end
	local tName = {"dunshou", "toushou", "jianshou", "cishou"}
	local tName1 = {"doodad_ds", "doodad_ts", "doodad_js", "doodad_cs"}
	for i = 1, 4 do
		if npc.szName == "BOSS4_" .. i then
			local npc_shou = scene.GetNpcByNickName(tName[i])
			if npc_shou then
				npc_shou.DoAction(0, 0)
				npc_shou.DoAction(0, 10061)
			end
			local doodad_s = scene.GetDoodadByNickName(tName1[i])
			if doodad_s then
				doodad_s.OpenDoor()
			end
			return
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com