---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/太原之战_逐虎驱狼/史思明_十殿阎罗_传功子技能.lua
-- 更新时间:	2014/10/19 19:03:01
-- 更新用户:	wangwei-pc2
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人   :  王洋
-- 创建时间	:  2007-12-11
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 10
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	--local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/npc/副本BOSS/太原之战_逐虎驱狼/史思明_十殿阎罗_传功子技能.lua",
		0														
	);

	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求自身属于自己的Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求目标属于自己的Buff

	-----------------技能施放技能需求-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --检查比较Caster自己已学习的技能ID和等级

	-----------------技能渐变相关-------------------------------------------
	--skill.nAttackAttenuationCof = 0;     --技能伤害渐变百分比，1024为100%，正数为增加，负数为减少。注意此参数只能在渐变类型的AOE中使用！
	--skill.SetSubSkillForAreaDepth(1,dwSkillID,dwSkillLevel);  --对第一个搜索到的目标施放子技能。注意此参数只能在渐变类型的AOE中使用！
	--skill.SetSubSkillForAreaDepth(2,dwSkillID,dwSkillLevel);  --对第二个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(3,dwSkillID,dwSkillLevel);  --对第三个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(4,dwSkillID,dwSkillLevel);  --对第四个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(5,dwSkillID,dwSkillLevel);  --对第五个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(6,dwSkillID,dwSkillLevel);  --对第六个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(7,dwSkillID,dwSkillLevel);  --对第七个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(8,dwSkillID,dwSkillLevel);  --对第八个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(9,dwSkillID,dwSkillLevel);  --对第九个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(10,dwSkillID,dwSkillLevel);  --对第十个搜索到的目标施放子技能。

	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	--skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--技能普通CD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--只检查不走的CD
	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能仇恨 -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- 技能是否可在吟唱中施放 -------------------------------------------------
	skill.bIgnorePrepareState = true	--技能是否可在吟唱中施放，吟唱、通道、蓄力技不能填true

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;									-- 技能消耗生命值
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- 技能消耗的内力
	--skill.nCostStamina	= 0;									-- 技能消耗的体力
	--skill.nCostItemType	= 0;									-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;									-- 技能消耗的物品索引ID

	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 技能是否需要聚气
	--skill.nNeedAccumulateCount = 0;				-- 技能需要气点的个数，当skill.bIsAccumulate	= true时生效
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定

	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离
	skill.nMaxRadius = 2 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径
	skill.nTargetCountLimit = 1;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	--skill.nMinPrepareFrames  	= -1;				-- 急速效果最小吟唱帧数：默认是-1，吟唱不受急速影响。大于等于0则受急速影响，最小读条时间为填的值
	--skill.nChannelInterval = 16; 				-- 通道技间隔时间
	--skill.nMinChannelInterval	= -1; 				-- 急速效果最小通道技间隔时间：默认是-1，通道不受急速影响。大于等于0则受急速影响，最通道间隔时间为填的值
	--skill.nChannelFrame = 96;	 			-- 通道技持续时间，单位帧数
	--skill.nMinChannelFrame	= -1; 				-- 通常配合急速最小间隔时间使用。使得通道技能整体加速。如果这个填-1，间隔不是-1，高急速可以多1跳
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧

	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）

	----------------- 目标血量需求 ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- 血量最小值>=
	--skill.nTargetLifePercentMax	= 100;			-- 血量最大值<=

	----------------- 自身血量需求 ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;				-- 血量最小值>=
	--skill.nSelfLifePercentMax	= 100;				-- 血量最大值<=

	----------------- 打退打断落马相关 -------------------------------------------------
	skill.nBeatBackRate = 0 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
	skill.nBrokenRate = 0 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
	skill.nBreakRate = 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024

	--skill.nDismountingRate	= 0;					-- 将目标击落下马几率,基数1024，默认0

	----------------- 武器伤害相关 ---------------------------------------------
	skill.nWeaponDamagePercent = 0;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%

	return true;
end

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)

end

--技能遗忘时执行的函数,参数skill为遗忘的skill
function OnSkillForgotten(skill, player)

end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local target_player = GetPlayer(dwCharacterID)
	if not target_player then	
		player.DelBuff(8408, 1)  --删除正在传功的标记
		--print("没有目标")
		return
	end
	local buff_zishen = player.GetBuff(8408, 1)
	if buff_zishen then
		if buff_zishen.nCustomValue == 1 then
			player.AddBuff(player.dwID, player.nLevel, 8408, 1)    --继续添加添加玩家正在传功的BUFF
			--print("目标内力已满，拒绝再次输入内力")
			return
		end			
	end
	local buff_mubiao = target_player.GetBuff(8408, 1)
	if buff_mubiao then
		if buff_mubiao.nCustomValue == 1 then
			if buff_zishen then
				buff_zishen.nCustomValue = 1
			end
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 9080), 4)
			--print("目标内力已满，拒绝再次输入内力2")
			return
		end			
	end
	player.TurnToCharacter(dwCharacterID)
	--[[目标是否符合被传功条件。  取消人数限制
	local buff_chuangong1 = target_player.GetBuff(8354, 1)
	local buff_chuangong2 = target_player.GetBuff(8410, 1)
	if buff_chuangong1 and buff_chuangong2 then	
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", "目标无法承受你的这份功力！", 4)
		--print("目标内力已满，拒绝再次输入内力3")
		player.DelBuff(8408, 1)  --删除正在传功的标记
		return
	elseif buff_chuangong1 then
		target_player.AddBuff(player.dwID, player.nLevel, 8410, 1)
		--有BUFF1则加BUFF2
	elseif buff_chuangong2 then
		--有BUFF2则加BUFF1.
		target_player.AddBuff(player.dwID, player.nLevel, 8354, 1)
	else
		--都没有则加BUFF1
		--print("目标是光的，添加第一种被传功BUFF")
		target_player.AddBuff(player.dwID, player.nLevel, 8354, 1)
	end
    --]]
	player.AddBuff(player.dwID, player.nLevel, 8408, 1)    --添加玩家正在传功的BUFF
	
	--1.每次把自己所有的8409转移给目标，并且转移自身10%的资源，
	--2.有蓝职业先转当前的蓝,蓝空转血,没蓝职业直接转血,丐帮每次转50%蓝
	local n_ziyuan = 0
	local buff_ziyuan = player.GetBuff(8409, 1)
	if buff_ziyuan then
		n_ziyuan = buff_ziyuan.nStackNum    
	end
	if n_ziyuan > 0 then
		for i = 1, n_ziyuan do                       --一边扣自己的一边加对面的
			player.DelBuff(8409, 1)
			target_player.AddBuff(player.dwID, player.nLevel, 8409, 1)
			target_player.nCurrentMana = target_player.nCurrentMana + 3000
		end
	end
	target_player.AddBuff(player.dwID, player.nLevel, 8409, 1) --再加一次是因为无论如何，本次都扣一次自身的资源，传递层数加1。
	
	if player.dwForceID == 7 or player.dwForceID == 8 or player.dwForceID == 10 or player.dwForceID == 21 then
		--7 唐门,8藏剑,10明教,21苍云,	直接扣血
		n_ziyuan = n_ziyuan + 1
		local damage = player.nMaxLife * 0.05								
		if player.nCurrentLife <= damage then
			player.CustomDamage(player.dwID, 13252, 1, 1, damage)
			player.DieByKiller(player.dwID)
		else
			player.CustomDamage(player.dwID, 13252, 1, 1, damage)
		end
		--[[
	elseif player.dwForceID == 9 then
		--9 丐帮，一次扣一半蓝
		if player.nCurrentMana >= player.nMaxMana * 0.5 then
			player.nCurrentMana = player.nCurrentMana - player.nMaxMana * 0.5
		else  --蓝不够一半，扣光，并且扣血
			player.nCurrentMana = 0
			local damage = player.nMaxLife * 0.1		
			if player.nCurrentLife <= damage then
				player.CustomDamage(player.dwID, 13252, 1, 1, damage)
				player.DieByKiller(player.dwID)
			else
				player.CustomDamage(player.dwID, 13252, 1, 1, damage)
			end
		end
		--]]
	else
		--其他有蓝职业一次扣10%内力，不足时才扣血，每次10%
		if player.nCurrentMana >= player.nMaxMana * 0.1 then
			player.nCurrentMana = player.nCurrentMana - player.nMaxMana * 0.1
		else  --蓝不够一半，扣光，并且扣血
			player.nCurrentMana = 0
			local damage = player.nMaxLife * 0.1		
			if player.nCurrentLife <= damage then
				player.CustomDamage(player.dwID, 13252, 1, 1, damage)
				player.DieByKiller(player.dwID)
			else
				player.CustomDamage(player.dwID, 13252, 1, 1, damage)
			end
		end		
	end

--当目标是与BOSS対掌的玩家时，根据目标身上的8409层数决定其标记BUFF。标记BUFF等级1~5，代表内力积累程度，第四级可以击退BOSS，第五级收益最大。
--根据场景不同，每次内力升级需要的层数也不同，
	local scene = player.GetScene()
	local n_lvup = 10
	if scene.dwMapID ~= 192 then
		n_lvup = 25
	end
	local buff_duizhang = target_player.GetBuff(8353, 1)
	if buff_duizhang then
		
		local buff_mubiaoziyuan = target_player.GetBuff(8409, 1)
		if buff_mubiaoziyuan then
		
			local n_Stack = buff_mubiaoziyuan.nStackNum
			if n_Stack >= n_lvup then
				--目标内力状态可以升级的时候，添加下一级BUFF，并删除n_lvup 层8409BUFF，如果目标没有8412BUFF，则添加一级的
				local n_neilizhuangtai = 0
				for i = 1, 4 do  --
					local buff_neilizhuangtai = target_player.GetBuff(8412, i)
					if buff_neilizhuangtai then
						n_neilizhuangtai = 1   --如果能取到状态buff则改变变量
						RemoteCallToClient(target_player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 9065), 4)
						RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 9079), 4)
						target_player.AddBuff(player.dwID, player.nLevel, 8412, i + 1)
						target_player.nCurrentMana = target_player.nCurrentMana + 3000 * n_lvup
						for j = 1, n_Stack do
							target_player.DelBuff(8409, 1)
						end
						if i == 3 then
							local npc_biaoxian = scene.GetNpcByNickName("boss4_duipinbiaoxian")
							if npc_biaoxian then
								npc_biaoxian.DoAction(0, 10069)
							end
						end
						if i == 4 then
							local buff_zishennow = player.GetBuff(8408, 1)
							if buff_zishennow then
								buff_zishennow.nCustomValue = 1
							end
						end
						break
					end					
				end
				if n_neilizhuangtai == 0 then
					--状态BUFF依旧为0，添加一级状态
					target_player.AddBuff(player.dwID, player.nLevel, 8412, 1)
					RemoteCallToClient(target_player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 9065), 4)
					RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 9079), 4)
					for j = 1, n_Stack do
						target_player.DelBuff(8409, 1)
					end
				end
			end
		end
	end
end
--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com