-- 编写者：linjiajia2
-- 版本号：37

Include('scripts/ai/customFuctions.lua')
Include('scripts/ai/AIParam.lua')
Include('scripts/ai/argumentStrings.ls')
Include('scripts/ai/GuarderParam.lua')

g_AIDebugInfo = {}

function Setup(ai)
	local state
	local action
	local param = g_AIParam[ai.nAIType]

	-- 注册自定义动作
	ai.RegisterUserAction(1104, 'SetAlertEffect')
	ai.RegisterUserAction(1105, 'UpdateAlertEffect')
	ai.RegisterUserAction(1106, 'CancelAlertEffect')
	ai.RegisterUserAction(2191, 'CustomAction191')
	ai.RegisterUserAction(1081, 'CLEAR_SELECTION')
	ai.RegisterUserAction(2334, 'CustomAction334')

	-- 初始状态
	state = ai.NewState(1)
	state.HandleEvent(AI_EVENT.ON_PRIMARY_TIMER, 2)

	-- 记录原点位置
	action = ai.NewAction(2, AI_ACTION.RECORD_ORIGIN_POSITION)
	action.SetBranch(311)
	g_AIDebugInfo[2] = '[2] RECORD_ORIGIN_POSITION()'

	-- 记录返回点
	action = ai.NewAction(311, AI_ACTION.RECORD_RETURN_POSITION)
	action.SetBranch(334)
	g_AIDebugInfo[311] = '[311] RECORD_RETURN_POSITION()'

	-- 获得守卫参数
	action = ai.NewAction(334, 2334)
	action.SetBranch(4)
	g_AIDebugInfo[334] = '[334] CustomAction334()'

	-- 进入巡逻路径
	action = ai.NewAction(4, AI_ACTION.ENTER_PATROL_PATH)
	action.SetParam(param['PatrolPathID'], param['PatrolOrderIndex'])
	action.SetBranch(336)
	g_AIDebugInfo[4] = '[4] ENTER_PATROL_PATH(param[PatrolPathID], param[PatrolOrderIndex])'

	-- 设置第三定时器
	action = ai.NewAction(336, AI_ACTION.SET_TERTIARY_TIMER)
	action.SetParam(80)
	action.SetBranch(6)
	g_AIDebugInfo[336] = '[336] SET_TERTIARY_TIMER(80)'

	-- 主状态选择
	action = ai.NewAction(6, AI_ACTION.SELECT_STATE)
	action.SetParam(param['WanderRange'])
	action.SetBranch(8, 14, 16)
	g_AIDebugInfo[6] = '[6] SELECT_STATE(param[WanderRange])'

	-- 到下一个巡逻点
	action = ai.NewAction(8, AI_ACTION.DO_PATROL)
	action.SetBranch(18, 18)
	g_AIDebugInfo[8] = '[8] DO_PATROL()'

	-- 设置主定时器
	action = ai.NewAction(18, AI_ACTION.SET_PRIMARY_TIMER)
	action.SetParam(16)
	action.SetBranch(379)
	g_AIDebugInfo[18] = '[18] SET_PRIMARY_TIMER(16)'

	-- 设置状态
	action = ai.NewAction(379, AI_ACTION.SET_STATE)
	action.SetParam(23) -- 主状态
	g_AIDebugInfo[379] = '[379] SetParam(State23)'

	-- 主状态
	state = ai.NewState(23)
	state.HandleEvent(AI_EVENT.ON_SECONDARY_TIMER, 6)
	state.HandleEvent(AI_EVENT.ON_PRIMARY_TIMER, 26)
	state.HandleEvent(AI_EVENT.ON_ATTACKED, 180)
	state.HandleEvent(AI_EVENT.ON_DIALOG, 61)
	state.HandleEvent(AI_EVENT.ON_IN_FEAR, 125)
	state.HandleEvent(AI_EVENT.ON_PATH_FAILED, 6)
	state.HandleEvent(AI_EVENT.ON_BEGIN_PREPARE, 223)
	state.HandleEvent(AI_EVENT.ON_PATH_SUCCESS, 12)
	state.HandleEvent(AI_EVENT.ON_TERTIARY_TIMER, 339)

	-- 选中第一仇恨
	action = ai.NewAction(26, AI_ACTION.SELECT_FIRST_THREAT)
	action.SetBranch(36, 28)
	g_AIDebugInfo[26] = '[26] SELECT_FIRST_THREAT()'

	-- 目标加入仇恨列表
	action = ai.NewAction(36, AI_ACTION.ADD_TARGET_TO_THREAT_LIST)
	action.SetBranch(38)
	g_AIDebugInfo[36] = '[36] ADD_TARGET_TO_THREAT_LIST()'

	-- 记录返回点
	action = ai.NewAction(38, AI_ACTION.RECORD_RETURN_POSITION)
	action.SetBranch(40)
	g_AIDebugInfo[38] = '[38] RECORD_RETURN_POSITION()'

	-- 站立
	action = ai.NewAction(40, AI_ACTION.STAND)
	action.SetBranch(315)
	g_AIDebugInfo[40] = '[40] STAND()'

	-- 判断目标是否存在
	action = ai.NewAction(315, AI_ACTION.IS_TARGET_EXIST)
	action.SetBranch(175, 307)
	g_AIDebugInfo[315] = '[315] IS_TARGET_EXIST()'

	-- 面向目标
	action = ai.NewAction(175, AI_ACTION.FACE_TARGET)
	action.SetParam(1)
	action.SetBranch(307)
	g_AIDebugInfo[175] = '[175] FACE_TARGET(1)'

	-- 参数比较
	action = ai.NewAction(307, AI_ACTION.PARAM_COMPARE)
	action.SetParam(param['IsSnarlInFight'], 1)
	action.SetBranch(304, 304, 44)
	g_AIDebugInfo[307] = '[307] PARAM_COMPARE(param[IsSnarlInFight], 1)'

	-- 释放技能
	action = ai.NewAction(304, AI_ACTION.CAST_SKILL)
	action.SetParam(514, 1)
	action.SetBranch(44, 44)
	g_AIDebugInfo[304] = '[304] CAST_SKILL(514, 1)'

	-- 初始化技能CD
	action = ai.NewAction(44, AI_ACTION.NPC_INIT_SKILL_CD)
	action.SetBranch(145)
	g_AIDebugInfo[44] = '[44] NPC_INIT_SKILL_CD()'

	-- 设置主定时器
	action = ai.NewAction(145, AI_ACTION.SET_PRIMARY_TIMER)
	action.SetParam(8)
	action.SetBranch(381)
	g_AIDebugInfo[145] = '[145] SET_PRIMARY_TIMER(8)'

	-- 设置状态
	action = ai.NewAction(381, AI_ACTION.SET_STATE)
	action.SetParam(84) -- 战斗状态
	g_AIDebugInfo[381] = '[381] SetParam(State84)'

	-- 战斗状态
	state = ai.NewState(84)
	state.HandleEvent(AI_EVENT.ON_PRIMARY_TIMER, 85)
	state.HandleEvent(AI_EVENT.ON_IN_FEAR, 189)
	state.HandleEvent(AI_EVENT.ON_PATH_FAILED, 101)
	state.HandleEvent(AI_EVENT.ON_PATH_SUCCESS, 318)
	state.HandleEvent(AI_EVENT.ON_BEGIN_PREPARE, 223)

	-- 选中第一仇恨
	action = ai.NewAction(85, AI_ACTION.SELECT_FIRST_THREAT)
	action.SetBranch(245, 343)
	g_AIDebugInfo[85] = '[85] SELECT_FIRST_THREAT()'

	-- 离开返回点距离比较
	action = ai.NewAction(343, AI_ACTION.RETURN_POSITION_DISTANCE_COMPARE)
	action.SetParam(3840)
	action.SetBranch(101, 342, 342)
	g_AIDebugInfo[343] = '[343] RETURN_POSITION_DISTANCE_COMPARE(3840)'

	-- 搜索斗殴玩家并加入仇恨
	action = ai.NewAction(342, AI_ACTION.SEARCH_BUSTUP_PLAYER_ADD_THREAT_LIST)
	action.SetParam(1920, 0, 0)
	action.SetBranch(376, 101)
	g_AIDebugInfo[342] = '[342] SEARCH_BUSTUP_PLAYER_ADD_THREAT_LIST(1920, 0, 0)'

	-- 守卫根据仇恨列表标记斗殴玩家
	action = ai.NewAction(376, AI_ACTION.MARKED_BUSTUP_PLAYER_BY_GUARD)
	action.SetParam(10794, 1)
	action.SetBranch(145)
	g_AIDebugInfo[376] = '[376] MARKED_BUSTUP_PLAYER_BY_GUARD(10794, 1)'

	-- 设置无敌状态
	action = ai.NewAction(101, AI_ACTION.SET_SYSTEM_SHEILD)
	action.SetParam(1)
	action.SetBranch(120)
	g_AIDebugInfo[101] = '[101] SET_SYSTEM_SHEILD(1)'

	-- 清除减益Buff
	action = ai.NewAction(120, AI_ACTION.CLEAN_DEBUFF)
	action.SetBranch(103)
	g_AIDebugInfo[120] = '[120] CLEAN_DEBUFF()'

	-- 回到返回点
	action = ai.NewAction(103, AI_ACTION.RETURN)
	action.SetParam(0)
	action.SetBranch(105, 105)
	g_AIDebugInfo[103] = '[103] RETURN(0)'

	-- 设置主定时器
	action = ai.NewAction(105, AI_ACTION.SET_PRIMARY_TIMER)
	action.SetParam(160)
	action.SetBranch(383)
	g_AIDebugInfo[105] = '[105] SET_PRIMARY_TIMER(160)'

	-- 设置状态
	action = ai.NewAction(383, AI_ACTION.SET_STATE)
	action.SetParam(108) -- 返回状态
	g_AIDebugInfo[383] = '[383] SetParam(State108)'

	-- 返回状态
	state = ai.NewState(108)
	state.HandleEvent(AI_EVENT.ON_PRIMARY_TIMER, 109)
	state.HandleEvent(AI_EVENT.ON_PATH_SUCCESS, 109)
	state.HandleEvent(AI_EVENT.ON_PATH_FAILED, 109)

	-- 回到返回点
	action = ai.NewAction(109, AI_ACTION.RETURN)
	action.SetParam(1)
	action.SetBranch(113, 113)
	g_AIDebugInfo[109] = '[109] RETURN(1)'

	-- 保持原始原点朝向
	action = ai.NewAction(113, AI_ACTION.KEEP_ORIGIN_DIRECTION)
	action.SetBranch(281)
	g_AIDebugInfo[113] = '[113] KEEP_ORIGIN_DIRECTION()'

	-- 参数比较
	action = ai.NewAction(281, AI_ACTION.PARAM_COMPARE)
	action.SetParam(param['ReviveTeammate'], 1)
	action.SetBranch(282, 282, 116)
	g_AIDebugInfo[281] = '[281] PARAM_COMPARE(param[ReviveTeammate], 1)'

	-- NPC组重生
	action = ai.NewAction(282, AI_ACTION.GROUP_REVIVE)
	action.SetBranch(116)
	g_AIDebugInfo[282] = '[282] GROUP_REVIVE()'

	-- 设置主定时器
	action = ai.NewAction(116, AI_ACTION.SET_PRIMARY_TIMER)
	action.SetParam(32)
	action.SetBranch(385)
	g_AIDebugInfo[116] = '[116] SET_PRIMARY_TIMER(32)'

	-- 设置状态
	action = ai.NewAction(385, AI_ACTION.SET_STATE)
	action.SetParam(119) -- 睡眠状态
	g_AIDebugInfo[385] = '[385] SetParam(State119)'

	-- 睡眠状态
	state = ai.NewState(119)
	state.HandleEvent(AI_EVENT.ON_PRIMARY_TIMER, 122)

	-- 设置无敌状态
	action = ai.NewAction(122, AI_ACTION.SET_SYSTEM_SHEILD)
	action.SetParam(0)
	action.SetBranch(336)
	g_AIDebugInfo[122] = '[122] SET_SYSTEM_SHEILD(0)'

	-- 判断目标是否入水
	action = ai.NewAction(245, AI_ACTION.IS_TARGE_IN_WATER)
	action.SetBranch(252, 87)
	g_AIDebugInfo[245] = '[245] IS_TARGE_IN_WATER()'

	-- 设置副定时器
	action = ai.NewAction(252, AI_ACTION.SET_SECONDARY_TIMER)
	action.SetParam(80)
	action.SetBranch(251)
	g_AIDebugInfo[252] = '[252] SET_SECONDARY_TIMER(80)'

	-- 设置主定时器
	action = ai.NewAction(251, AI_ACTION.SET_PRIMARY_TIMER)
	action.SetParam(16)
	action.SetBranch(387)
	g_AIDebugInfo[251] = '[251] SET_PRIMARY_TIMER(16)'

	-- 设置状态
	action = ai.NewAction(387, AI_ACTION.SET_STATE)
	action.SetParam(250) -- 判断水中超时状态
	g_AIDebugInfo[387] = '[387] SetParam(State250)'

	-- 判断水中超时状态
	state = ai.NewState(250)
	state.HandleEvent(AI_EVENT.ON_PRIMARY_TIMER, 256)
	state.HandleEvent(AI_EVENT.ON_SECONDARY_TIMER, 101)
	state.HandleEvent(AI_EVENT.ON_BEGIN_PREPARE, 223)

	-- 判断目标是否存在
	action = ai.NewAction(256, AI_ACTION.IS_TARGET_EXIST)
	action.SetBranch(255, 85)
	g_AIDebugInfo[256] = '[256] IS_TARGET_EXIST()'

	-- 判断目标是否入水
	action = ai.NewAction(255, AI_ACTION.IS_TARGE_IN_WATER)
	action.SetBranch(251, 87)
	g_AIDebugInfo[255] = '[255] IS_TARGE_IN_WATER()'

	-- 逃跑判断
	action = ai.NewAction(87, AI_ACTION.NEED_ESCAPE)
	action.SetParam(param['EscapeRange'], param['EscapeLife'])
	action.SetBranch(89, 95)
	g_AIDebugInfo[87] = '[87] NEED_ESCAPE(param[EscapeRange], param[EscapeLife])'

	-- 标准技能选择
	action = ai.NewAction(89, AI_ACTION.NPC_STANDARD_SKILL_SELECTOR)
	action.SetBranch(318, 286)
	g_AIDebugInfo[89] = '[89] NPC_STANDARD_SKILL_SELECTOR()'

	-- 判断目标是否存在
	action = ai.NewAction(318, AI_ACTION.IS_TARGET_EXIST)
	action.SetBranch(91, 145)
	g_AIDebugInfo[318] = '[318] IS_TARGET_EXIST()'

	-- 保持施法距离
	action = ai.NewAction(91, AI_ACTION.NPC_KEEP_SKILL_CAST_RANGE)
	action.SetBranch(266, 145)
	g_AIDebugInfo[91] = '[91] NPC_KEEP_SKILL_CAST_RANGE()'

	-- 面向目标
	action = ai.NewAction(266, AI_ACTION.FACE_TARGET)
	action.SetParam(1)
	action.SetBranch(169)
	g_AIDebugInfo[266] = '[266] FACE_TARGET(1)'

	-- 站立
	action = ai.NewAction(169, AI_ACTION.STAND)
	action.SetBranch(93)
	g_AIDebugInfo[169] = '[169] STAND()'

	-- 自动释放技能
	action = ai.NewAction(93, AI_ACTION.NPC_CAST_SELECT_SKILL)
	action.SetBranch(191, 193)
	g_AIDebugInfo[93] = '[93] NPC_CAST_SELECT_SKILL()'

	-- 释放背击击晕技能
	action = ai.NewAction(191, 2191)
	action.SetBranch(197)
	g_AIDebugInfo[191] = '[191] CustomAction191()'

	-- 设置NPC技能动作副定时器
	action = ai.NewAction(197, AI_ACTION.NPC_SET_SEC_TIMER_BY_SKILL_ANI)
	action.SetBranch(389, 145)
	g_AIDebugInfo[197] = '[197] NPC_SET_SEC_TIMER_BY_SKILL_ANI()'

	-- 设置状态
	action = ai.NewAction(389, AI_ACTION.SET_STATE)
	action.SetParam(198) -- SkillAniFrame
	g_AIDebugInfo[389] = '[389] SetParam(State198)'

	-- SkillAniFrame
	state = ai.NewState(198)
	state.HandleEvent(AI_EVENT.ON_SECONDARY_TIMER, 201)
	state.HandleEvent(AI_EVENT.ON_BEGIN_PREPARE, 223)
	state.HandleEvent(AI_EVENT.ON_IN_FEAR, 189)

	-- 设置NPC技能停止副定时器
	action = ai.NewAction(201, AI_ACTION.NPC_SET_SEC_TIMER_BY_SKILL_REST)
	action.SetBranch(289, 85)
	g_AIDebugInfo[201] = '[201] NPC_SET_SEC_TIMER_BY_SKILL_REST()'

	-- 判断是否需要追击
	action = ai.NewAction(289, AI_ACTION.IS_NEED_KEEP_RANGE)
	action.SetBranch(203, 208)
	g_AIDebugInfo[289] = '[289] IS_NEED_KEEP_RANGE()'

	-- 设置主定时器
	action = ai.NewAction(208, AI_ACTION.SET_PRIMARY_TIMER)
	action.SetParam(16)
	action.SetBranch(391)
	g_AIDebugInfo[208] = '[208] SET_PRIMARY_TIMER(16)'

	-- 设置状态
	action = ai.NewAction(391, AI_ACTION.SET_STATE)
	action.SetParam(199) -- SkillRestFrame
	g_AIDebugInfo[391] = '[391] SetParam(State199)'

	-- SkillRestFrame
	state = ai.NewState(199)
	state.HandleEvent(AI_EVENT.ON_PRIMARY_TIMER, 203)
	state.HandleEvent(AI_EVENT.ON_SECONDARY_TIMER, 85)
	state.HandleEvent(AI_EVENT.ON_PATH_SUCCESS, 203)
	state.HandleEvent(AI_EVENT.ON_IN_FEAR, 189)
	state.HandleEvent(AI_EVENT.ON_BEGIN_PREPARE, 223)

	-- 判断目标是否存在
	action = ai.NewAction(203, AI_ACTION.IS_TARGET_EXIST)
	action.SetBranch(206, 208)
	g_AIDebugInfo[203] = '[203] IS_TARGET_EXIST()'

	-- 保持距离
	action = ai.NewAction(206, AI_ACTION.KEEP_RANGE)
	action.SetParam(32, 160)
	action.SetBranch(264, 208)
	g_AIDebugInfo[206] = '[206] KEEP_RANGE(32, 160)'

	-- 面向目标
	action = ai.NewAction(264, AI_ACTION.FACE_TARGET)
	action.SetParam(1)
	action.SetBranch(208)
	g_AIDebugInfo[264] = '[264] FACE_TARGET(1)'

	-- 记录返回点
	action = ai.NewAction(189, AI_ACTION.RECORD_RETURN_POSITION)
	action.SetBranch(125)
	g_AIDebugInfo[189] = '[189] RECORD_RETURN_POSITION()'

	-- 随机跑动
	action = ai.NewAction(125, AI_ACTION.RANDOM_RUN)
	action.SetParam(1280)
	action.SetBranch(127)
	g_AIDebugInfo[125] = '[125] RANDOM_RUN(1280)'

	-- 设置主定时器
	action = ai.NewAction(127, AI_ACTION.SET_PRIMARY_TIMER)
	action.SetParam(16)
	action.SetBranch(393)
	g_AIDebugInfo[127] = '[127] SET_PRIMARY_TIMER(16)'

	-- 设置状态
	action = ai.NewAction(393, AI_ACTION.SET_STATE)
	action.SetParam(124) -- 恐惧状态
	g_AIDebugInfo[393] = '[393] SetParam(State124)'

	-- 恐惧状态
	state = ai.NewState(124)
	state.HandleEvent(AI_EVENT.ON_PRIMARY_TIMER, 125)
	state.HandleEvent(AI_EVENT.ON_PATH_SUCCESS, 125)
	state.HandleEvent(AI_EVENT.ON_OUT_FEAR, 85)
	state.HandleEvent(AI_EVENT.ON_PATH_FAILED, 125)
	state.HandleEvent(AI_EVENT.ON_BEGIN_PREPARE, 223)

	-- 设置主定时器
	action = ai.NewAction(223, AI_ACTION.SET_PRIMARY_TIMER)
	action.SetParam(8)
	action.SetBranch(395)
	g_AIDebugInfo[223] = '[223] SET_PRIMARY_TIMER(8)'

	-- 设置状态
	action = ai.NewAction(395, AI_ACTION.SET_STATE)
	action.SetParam(200) -- 吟唱状态
	g_AIDebugInfo[395] = '[395] SetParam(State200)'

	-- 吟唱状态
	state = ai.NewState(200)
	state.HandleEvent(AI_EVENT.ON_CAST_SKILL_FAILED, 234)
	state.HandleEvent(AI_EVENT.ON_CAST_SKILL, 232)
	state.HandleEvent(AI_EVENT.ON_IN_FEAR, 243)
	state.HandleEvent(AI_EVENT.ON_BREAK_PREPARE, 313)
	state.HandleEvent(AI_EVENT.ON_PRIMARY_TIMER, 351)

	-- 清除NPC当前选择技能CD
	action = ai.NewAction(234, AI_ACTION.NPC_CLEAR_SELECT_SKILL_CD)
	action.SetBranch(85)
	g_AIDebugInfo[234] = '[234] NPC_CLEAR_SELECT_SKILL_CD()'

	-- 重置NPC当前选择技能CD
	action = ai.NewAction(232, AI_ACTION.NPC_RESET_SELECT_SKILL_CD)
	action.SetBranch(197)
	g_AIDebugInfo[232] = '[232] NPC_RESET_SELECT_SKILL_CD()'

	-- 重置NPC当前选择技能CD
	action = ai.NewAction(243, AI_ACTION.NPC_RESET_SELECT_SKILL_CD)
	action.SetBranch(189)
	g_AIDebugInfo[243] = '[243] NPC_RESET_SELECT_SKILL_CD()'

	-- 重置NPC当前选择技能CD
	action = ai.NewAction(313, AI_ACTION.NPC_RESET_SELECT_SKILL_CD)
	action.SetBranch(85)
	g_AIDebugInfo[313] = '[313] NPC_RESET_SELECT_SKILL_CD()'

	-- 判断指定OTAction
	action = ai.NewAction(351, AI_ACTION.IS_OTACTION_STATE)
	action.SetParam(CHARACTER_OTACTION_TYPE.ACTION_SKILL_PREPARE)
	action.SetBranch(352, 232)
	g_AIDebugInfo[351] = '[351] IS_OTACTION_STATE(CHARACTER_OTACTION_TYPE.ACTION_SKILL_PREPARE)'

	-- 判断目标是否存在
	action = ai.NewAction(352, AI_ACTION.IS_TARGET_EXIST)
	action.SetBranch(356, 223)
	g_AIDebugInfo[352] = '[352] IS_TARGET_EXIST()'

	-- 面向目标
	action = ai.NewAction(356, AI_ACTION.FACE_TARGET)
	action.SetParam(1)
	action.SetBranch(223)
	g_AIDebugInfo[356] = '[356] FACE_TARGET(1)'

	-- 检查技能失败计数器
	action = ai.NewAction(193, AI_ACTION.CHECK_SKILL_FAILED_COUNTER)
	action.SetParam(3)
	action.SetBranch(145, 101)
	g_AIDebugInfo[193] = '[193] CHECK_SKILL_FAILED_COUNTER(3)'

	-- 判断是否需要追击
	action = ai.NewAction(286, AI_ACTION.IS_NEED_KEEP_RANGE)
	action.SetBranch(321, 145)
	g_AIDebugInfo[286] = '[286] IS_NEED_KEEP_RANGE()'

	-- 判断目标是否存在
	action = ai.NewAction(321, AI_ACTION.IS_TARGET_EXIST)
	action.SetBranch(268, 145)
	g_AIDebugInfo[321] = '[321] IS_TARGET_EXIST()'

	-- 保持距离
	action = ai.NewAction(268, AI_ACTION.KEEP_RANGE)
	action.SetParam(32, 160)
	action.SetBranch(269, 271)
	g_AIDebugInfo[268] = '[268] KEEP_RANGE(32, 160)'

	-- 面向目标
	action = ai.NewAction(269, AI_ACTION.FACE_TARGET)
	action.SetParam(1)
	action.SetBranch(271)
	g_AIDebugInfo[269] = '[269] FACE_TARGET(1)'

	-- 设置主定时器
	action = ai.NewAction(271, AI_ACTION.SET_PRIMARY_TIMER)
	action.SetParam(8)
	action.SetBranch(397)
	g_AIDebugInfo[271] = '[271] SET_PRIMARY_TIMER(8)'

	-- 设置状态
	action = ai.NewAction(397, AI_ACTION.SET_STATE)
	action.SetParam(274) -- 未选中技能状态
	g_AIDebugInfo[397] = '[397] SetParam(State274)'

	-- 未选中技能状态
	state = ai.NewState(274)
	state.HandleEvent(AI_EVENT.ON_PRIMARY_TIMER, 85)
	state.HandleEvent(AI_EVENT.ON_PATH_SUCCESS, 85)
	state.HandleEvent(AI_EVENT.ON_PATH_FAILED, 101)
	state.HandleEvent(AI_EVENT.ON_IN_FEAR, 125)
	state.HandleEvent(AI_EVENT.ON_BEGIN_PREPARE, 223)

	-- 设置副定时器
	action = ai.NewAction(95, AI_ACTION.SET_SECONDARY_TIMER)
	action.SetParam(param['EscapeTime'])
	action.SetBranch(98)
	g_AIDebugInfo[95] = '[95] SET_SECONDARY_TIMER(param[EscapeTime])'

	-- 随机跑动
	action = ai.NewAction(98, AI_ACTION.RANDOM_RUN)
	action.SetParam(param['EscapeRange'])
	action.SetBranch(162)
	g_AIDebugInfo[98] = '[98] RANDOM_RUN(param[EscapeRange])'

	-- 设置主定时器
	action = ai.NewAction(162, AI_ACTION.SET_PRIMARY_TIMER)
	action.SetParam(param['EscapeInterval'])
	action.SetBranch(399)
	g_AIDebugInfo[162] = '[162] SET_PRIMARY_TIMER(param[EscapeInterval])'

	-- 设置状态
	action = ai.NewAction(399, AI_ACTION.SET_STATE)
	action.SetParam(97) -- 逃跑状态
	g_AIDebugInfo[399] = '[399] SetParam(State97)'

	-- 逃跑状态
	state = ai.NewState(97)
	state.HandleEvent(AI_EVENT.ON_PRIMARY_TIMER, 98)
	state.HandleEvent(AI_EVENT.ON_IN_FEAR, 189)
	state.HandleEvent(AI_EVENT.ON_SECONDARY_TIMER, 85)
	state.HandleEvent(AI_EVENT.ON_BEGIN_PREPARE, 223)

	-- 参数比较
	action = ai.NewAction(28, AI_ACTION.PARAM_COMPARE)
	action.SetParam(param['IsPositive'], 1)
	action.SetBranch(30, 30, 18)
	g_AIDebugInfo[28] = '[28] PARAM_COMPARE(param[IsPositive], 1)'

	-- 搜索敌人
	action = ai.NewAction(30, AI_ACTION.SEARCH_ENEMY)
	action.SetParam(0, 0, 0, 0)
	action.SetBranch(36, 135)
	g_AIDebugInfo[30] = '[30] SEARCH_ENEMY(0, 0, 0, 0)'

	-- 搜索敌人
	action = ai.NewAction(135, AI_ACTION.SEARCH_ENEMY)
	action.SetParam(0, 0, 0, 0)
	action.SetBranch(177, 18)
	g_AIDebugInfo[135] = '[135] SEARCH_ENEMY(0, 0, 0, 0)'

	-- 设置警戒效果
	action = ai.NewAction(177, 1104)
	action.SetBranch(46)
	g_AIDebugInfo[177] = '[177] SetAlertEffect()'

	-- 设置副定时器
	action = ai.NewAction(46, AI_ACTION.SET_SECONDARY_TIMER)
	action.SetParam(param['AlertOverTime'])
	action.SetBranch(48)
	g_AIDebugInfo[46] = '[46] SET_SECONDARY_TIMER(param[AlertOverTime])'

	-- 站立
	action = ai.NewAction(48, AI_ACTION.STAND)
	action.SetBranch(174)
	g_AIDebugInfo[48] = '[48] STAND()'

	-- 面向目标
	action = ai.NewAction(174, AI_ACTION.FACE_TARGET)
	action.SetParam(1)
	action.SetBranch(52)
	g_AIDebugInfo[174] = '[174] FACE_TARGET(1)'

	-- 设置主定时器
	action = ai.NewAction(52, AI_ACTION.SET_PRIMARY_TIMER)
	action.SetParam(8)
	action.SetBranch(401)
	g_AIDebugInfo[52] = '[52] SET_PRIMARY_TIMER(8)'

	-- 设置状态
	action = ai.NewAction(401, AI_ACTION.SET_STATE)
	action.SetParam(54) -- 警戒状态
	g_AIDebugInfo[401] = '[401] SetParam(State54)'

	-- 警戒状态
	state = ai.NewState(54)
	state.HandleEvent(AI_EVENT.ON_SECONDARY_TIMER, 182)
	state.HandleEvent(AI_EVENT.ON_PRIMARY_TIMER, 56)
	state.HandleEvent(AI_EVENT.ON_IN_FEAR, 189)
	state.HandleEvent(AI_EVENT.ON_BEGIN_PREPARE, 223)

	-- 更新警戒效果
	action = ai.NewAction(182, 1105)
	action.SetBranch(36)
	g_AIDebugInfo[182] = '[182] UpdateAlertEffect()'

	-- 搜索敌人
	action = ai.NewAction(56, AI_ACTION.SEARCH_ENEMY)
	action.SetParam(0, 0, 0, 0)
	action.SetBranch(182, 183)
	g_AIDebugInfo[56] = '[56] SEARCH_ENEMY(0, 0, 0, 0)'

	-- 搜索敌人
	action = ai.NewAction(183, AI_ACTION.SEARCH_ENEMY)
	action.SetParam(0, 0, 0, 0)
	action.SetBranch(174, 184)
	g_AIDebugInfo[183] = '[183] SEARCH_ENEMY(0, 0, 0, 0)'

	-- 取消警戒效果
	action = ai.NewAction(184, 1106)
	action.SetBranch(336)
	g_AIDebugInfo[184] = '[184] CancelAlertEffect()'

	-- 更新警戒效果
	action = ai.NewAction(180, 1105)
	action.SetBranch(34)
	g_AIDebugInfo[180] = '[180] UpdateAlertEffect()'

	-- 选中事件发起者
	action = ai.NewAction(34, AI_ACTION.SELECT_EVENT_SRC)
	action.SetBranch(36, 38)
	g_AIDebugInfo[34] = '[34] SELECT_EVENT_SRC()'

	-- 站立
	action = ai.NewAction(61, AI_ACTION.STAND)
	action.SetBranch(63)
	g_AIDebugInfo[61] = '[61] STAND()'

	-- 选中事件发起者
	action = ai.NewAction(63, AI_ACTION.SELECT_EVENT_SRC)
	action.SetBranch(167, 67)
	g_AIDebugInfo[63] = '[63] SELECT_EVENT_SRC()'

	-- 面向目标
	action = ai.NewAction(167, AI_ACTION.FACE_TARGET)
	action.SetParam(param['IsAutoTurn'])
	action.SetBranch(67)
	g_AIDebugInfo[167] = '[167] FACE_TARGET(param[IsAutoTurn])'

	-- 打开对话窗口
	action = ai.NewAction(67, AI_ACTION.NPC_OPEN_DIALOG_WINDOW)
	action.SetBranch(69, 336)
	g_AIDebugInfo[67] = '[67] NPC_OPEN_DIALOG_WINDOW()'

	-- 参数比较
	action = ai.NewAction(69, AI_ACTION.PARAM_COMPARE)
	action.SetParam(param['IsAutoTurn'], 0)
	action.SetBranch(71, 6, 6)
	g_AIDebugInfo[69] = '[69] PARAM_COMPARE(param[IsAutoTurn], 0)'

	-- 设置副定时器
	action = ai.NewAction(71, AI_ACTION.SET_SECONDARY_TIMER)
	action.SetParam(320)
	action.SetBranch(73)
	g_AIDebugInfo[71] = '[71] SET_SECONDARY_TIMER(320)'

	-- 设置主定时器
	action = ai.NewAction(73, AI_ACTION.SET_PRIMARY_TIMER)
	action.SetParam(16)
	action.SetBranch(403)
	g_AIDebugInfo[73] = '[73] SET_PRIMARY_TIMER(16)'

	-- 设置状态
	action = ai.NewAction(403, AI_ACTION.SET_STATE)
	action.SetParam(75) -- 对话状态
	g_AIDebugInfo[403] = '[403] SetParam(State75)'

	-- 对话状态
	state = ai.NewState(75)
	state.HandleEvent(AI_EVENT.ON_PRIMARY_TIMER, 76)
	state.HandleEvent(AI_EVENT.ON_ATTACKED, 34)
	state.HandleEvent(AI_EVENT.ON_DIALOG, 63)
	state.HandleEvent(AI_EVENT.ON_IN_FEAR, 189)
	state.HandleEvent(AI_EVENT.ON_BEGIN_PREPARE, 223)
	state.HandleEvent(AI_EVENT.ON_SECONDARY_TIMER, 302)
	state.HandleEvent(AI_EVENT.ON_TERTIARY_TIMER, 363)

	-- 选中第一仇恨
	action = ai.NewAction(76, AI_ACTION.SELECT_FIRST_THREAT)
	action.SetBranch(36, 73)
	g_AIDebugInfo[76] = '[76] SELECT_FIRST_THREAT()'

	-- NPC清空选择
	action = ai.NewAction(302, 1081)
	action.SetBranch(336)
	g_AIDebugInfo[302] = '[302] CLEAR_SELECTION()'

	-- 搜索斗殴玩家并加入仇恨
	action = ai.NewAction(363, AI_ACTION.SEARCH_BUSTUP_PLAYER_ADD_THREAT_LIST)
	action.SetParam(1920, 0, 0)
	action.SetBranch(374, 366)
	g_AIDebugInfo[363] = '[363] SEARCH_BUSTUP_PLAYER_ADD_THREAT_LIST(1920, 0, 0)'

	-- 设置第三定时器
	action = ai.NewAction(366, AI_ACTION.SET_TERTIARY_TIMER)
	action.SetParam(80)
	action.SetBranch(73)
	g_AIDebugInfo[366] = '[366] SET_TERTIARY_TIMER(80)'

	-- 守卫根据仇恨列表标记斗殴玩家
	action = ai.NewAction(374, AI_ACTION.MARKED_BUSTUP_PLAYER_BY_GUARD)
	action.SetParam(10794, 1)
	action.SetBranch(336)
	g_AIDebugInfo[374] = '[374] MARKED_BUSTUP_PLAYER_BY_GUARD(10794, 1)'

	-- 设置副定时器
	action = ai.NewAction(12, AI_ACTION.SET_SECONDARY_TIMER)
	action.SetParam(param['WanderInterval'])
	action.SetBranch(26)
	g_AIDebugInfo[12] = '[12] SET_SECONDARY_TIMER(param[WanderInterval])'

	-- 搜索斗殴玩家并加入仇恨
	action = ai.NewAction(339, AI_ACTION.SEARCH_BUSTUP_PLAYER_ADD_THREAT_LIST)
	action.SetParam(1920, 0, 0)
	action.SetBranch(374, 336)
	g_AIDebugInfo[339] = '[339] SEARCH_BUSTUP_PLAYER_ADD_THREAT_LIST(1920, 0, 0)'

	-- 闲逛
	action = ai.NewAction(14, AI_ACTION.WANDER)
	action.SetParam(param['WanderRange'], param['WanderDistance'])
	action.SetBranch(12)
	g_AIDebugInfo[14] = '[14] WANDER(param[WanderRange], param[WanderDistance])'

	-- 保持原始原点朝向
	action = ai.NewAction(16, AI_ACTION.KEEP_ORIGIN_DIRECTION)
	action.SetBranch(10)
	g_AIDebugInfo[16] = '[16] KEEP_ORIGIN_DIRECTION()'

	-- 设置副定时器
	action = ai.NewAction(10, AI_ACTION.SET_SECONDARY_TIMER)
	action.SetParam(16)
	action.SetBranch(18)
	g_AIDebugInfo[10] = '[10] SET_SECONDARY_TIMER(16)'

	ai.SetInitState(1)
end

-- 调试方法
function DebugOnCallAction(action_id, character)
	if not character then
		print('[DebugOnCallAction] character is null')
		return
	end

	if not action_id or not g_AIDebugInfo[action_id] then
		print('[DebugOnCallAction] action_id is invalid ' .. tostring(action_id))
		return
	end

	character.OutputAIDebugInfo('[AI]<' .. character.dwID .. '> Call action: ' .. g_AIDebugInfo[action_id])
end

-- 本AI图内自定义脚本
function CustomAction334(npc, actionData)
	 local nProtectCampMark, nProtectForceMark = GetProtectCampMarkAndForceMark(npc.dwTemplateID)
	 npc.SetAIProtectCampMarkAndForceMark(nProtectCampMark, nProtectForceMark)
    return 1
end



function CustomAction191(npc, actionData)    
	local nTargetType, dwTargetID = npc.GetTarget()
	local dwLastCastSkillID, nLastCastSkillLevel = npc.GetAISelectSkill()
	if not IsPlayer(dwTargetID) then
		return 1
	end
	
	local target = GetPlayer(dwTargetID)
	if not target or not (dwLastCastSkillID == 28) then
		return 1
	end
	
	local nDifFace = math.abs(npc.nFaceDirection - target.nFaceDirection)
	--					-5	-4	-3	-2	-1	0	1	2	3	4	5	6	7	8	9	10	11
	local tRateTable = {50, 45, 40, 40, 40, 40, 40, 40, 35, 35, 30, 25, 20, 15, 10, 10, 5}
	local nLevelDif = target.nLevel - npc.nLevel + 6		-- 等级差, 数组的第6个为0
	if nLevelDif <= 1 then
		nLevelDif = 1
	elseif nLevelDif >= 17 then
		nLevelDif = 17
	end
	local nStunRate = tRateTable[nLevelDif] * 10000
		
	if nDifFace < 64 - 32 or nDifFace > 192 + 32 then		-- 背后90度, 全概率
		nStunRate = nStunRate
	elseif nDifFace < 64 or nDifFace > 192 then				-- 背后180度, 3/4 概率
		nStunRate = (nStunRate / 4) * 3
	elseif nDifFace < 64 + 16 or nDifFace > 192 - 16 then	-- 背后225度, 1/4 概率
		nStunRate = (nStunRate / 4)
	else
		return 1
	end
	
	-- 这里计算概率
	local nRand = Random(1000000)
	if target.nMoveState ~= MOVE_STATE.ON_RUN and target.nMoveState ~= MOVE_STATE.ON_JUMP then
		nStunRate = nStunRate / 4
	end
	
	-- 实际添加BUFF
	if nRand < nStunRate then
		target.AddBuff(npc.dwID, npc.nLevel, 789, 1, 0, 80)
		if target.bOnHorse then
			target.DownHorse() 
		end
	end

    return 1
end


 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com