---------------------------------------------------------------------->
-- 脚本名称:	scripts/player/Adventure.lua
-- 更新时间:	2015/6/24 10:23:14
-- 更新用户:	linjiajia2
-- 脚本说明:
----------------------------------------------------------------------<
Include("scripts/Map/世界奇遇/平生心愿/include/平生心愿_data.lh")

-- player.SetAdventureFlag(1,true) 设置奇遇标记位值时调用
function OnSetAdventureFlagSuccess(player, nIndex, bValue, nParam)
	nParam = nParam or 0
	if nParam == 0 then -- 默认为0时，设置奇遇当前任务变量。 不为0则不设置，某些分支奇遇不刷新跟踪界面时不填0
		if bValue then 
			player.SetCustomUnsigned4(383, nIndex)
		end
	end
end

-- 设置奇遇后置变量 奇遇任务（任务表制作）完成后，设置nAdventureTaskID为true。
--	（注意：所有任务完成后都会调用此函数）
-- nAdventureTaskID：任务表里的后置奇遇任务ID，默认为0-表示无（AfterAdventureTaskID）
-- nQuestkID: 任务ID
function SetAdventureStateByQuest(player, nQuestkID, nAdventureTaskID)
	--设置nAdventureTaskID（这个是任务表里的，默认为0-表示无）为true, 活动组提的需求，方便奇遇制作。
	if nAdventureTaskID and nAdventureTaskID ~= 0 then 
		player.SetAdventureFlag(nAdventureTaskID, true)
	end
end

-- 奇遇前置变量判断, 任务前置判断 。
--	（任务接取前调用此函数,PreAdventureTaskID==0 or nil则不调用）
-- nAdventureTaskID：任务表里的前置奇遇任务ID（PreAdventureTaskID）
-- nQuestkID: 任务ID
function CheckAdventureStateByQuest(player, nQuestkID, nAdventureTaskID)
	if nAdventureTaskID and nAdventureTaskID ~= 0 then
		return	player.GetAdventureFlag(nAdventureTaskID)
	end
	return true
end

-- 阅读触发奇遇
function OnReadDoodadFinished(player)
	Adventure_ReadBookAdventure.TryStartAdventure(player,100)	--阅读碑文额外增加1%概率触发
end

-- 抄书结束触发奇遇
function OnCopyFinished(player)
	Adventure_ReadBookAdventure.TryStartAdventure(player,0)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com