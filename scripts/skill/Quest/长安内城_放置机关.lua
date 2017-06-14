---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/�����ڳ�_���û���.lua
-- ����ʱ��:	2013/8/27 13:57:51
-- �����û�:	zhouyixiao1
-- �ű�˵��:	
----------------------------------------------------------------------<

----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  ����	
-- ����ʱ��	:  2007-12-11
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 10
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/Quest/�����ڳ�_���û���.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
	skill.AddSlowCheckSelfBuff(6649, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(6494, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff   

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	
	-----------------���ܽ������-------------------------------------------
	--skill.nAttackAttenuationCof = 0;     --�����˺�����ٷֱȣ�1024Ϊ100%������Ϊ���ӣ�����Ϊ���١�ע��˲���ֻ���ڽ������͵�AOE��ʹ�ã�
	--skill.SetSubSkillForAreaDepth(1,dwSkillID,dwSkillLevel);  --�Ե�һ����������Ŀ��ʩ���Ӽ��ܡ�ע��˲���ֻ���ڽ������͵�AOE��ʹ�ã�
	--skill.SetSubSkillForAreaDepth(2,dwSkillID,dwSkillLevel);  --�Եڶ�����������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(3,dwSkillID,dwSkillLevel);  --�Ե�������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(4,dwSkillID,dwSkillLevel);  --�Ե��ĸ���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(5,dwSkillID,dwSkillLevel);  --�Ե������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(6,dwSkillID,dwSkillLevel);  --�Ե�������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(7,dwSkillID,dwSkillLevel);  --�Ե��߸���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(8,dwSkillID,dwSkillLevel);  --�Եڰ˸���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(9,dwSkillID,dwSkillLevel);  --�ԵھŸ���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(10,dwSkillID,dwSkillLevel);  --�Ե�ʮ����������Ŀ��ʩ���Ӽ��ܡ�
	
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 635);	--������ͨCD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--ֻ��鲻�ߵ�CD
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;
	
	----------------- �����Ƿ����������ʩ�� -------------------------------------------------
	--skill.bIgnorePrepareState = true	--�����Ƿ����������ʩ�ţ�������ͨ����������������true
	
	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
    
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 20 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange		= 128;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nMinPrepareFrames  	= -1;				-- ����Ч����С����֡����Ĭ����-1���������ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��С����ʱ��Ϊ���ֵ
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
	--skill.nMinChannelInterval	= -1; 				-- ����Ч����Сͨ�������ʱ�䣺Ĭ����-1��ͨ�����ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��ͨ�����ʱ��Ϊ���ֵ
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nMinChannelFrame	= -1; 				-- ͨ����ϼ�����С���ʱ��ʹ�á�ʹ��ͨ������������١���������-1���������-1���߼��ٿ��Զ�1��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	--skill.nTargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=
    
	----------------- ����Ѫ������ ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;				-- Ѫ����Сֵ>=
	--skill.nSelfLifePercentMax	= 100;				-- Ѫ�����ֵ<=
    
	----------------- ���˴��������� -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0
	
	----------------- �����˺���� ---------------------------------------------
	skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	if nPreResult == SKILL_RESULT_CODE.SUCCESS then
		local nTargetType, dwTargetID = player.GetTarget()
		local npc = GetNpc(dwTargetID)
		local scene = player.GetScene()
		local nQuestID = 11538
		local nQuestIndex = player.GetQuestIndex(nQuestID)
		local nQuestPhase = player.GetQuestPhase(nQuestID)
		local nQuestID1 = 11801
		local nQuestIndex1 = player.GetQuestIndex(nQuestID1)
		local nQuestPhase1 = player.GetQuestPhase(nQuestID1)
		local NPClangya = scene.GetNpcByNickName("SSDJ_langya" .. player.dwID)
		local NPCbiaoji1 = scene.GetNpcByNickName("DSbiaoji1" .. player.dwID)
		local NPCbiaoji2 = scene.GetNpcByNickName("DSbiaoji2" .. player.dwID)
		local Value = player.GetQuestValue(nQuestIndex, 1)
		local Value1 = player.GetQuestValue(nQuestIndex1, 1)
		if nQuestIndex and nQuestPhase == 1 then
			if Value ~= 1 then
				if NPClangya then
					local dwPlayerID = NPClangya.GetCustomUnsigned4(0)
					if GetDistanceSq(player.nX, player.nY, player.nZ, 111818, 118050, 1157376) <= 256 ^ 2 then  --��һ���ڵ�������
						local NPCdusha = scene.CreateNpc(26347, 111833, 118051, 1157376, 128, 960, "dusha1" .. dwPlayerID, dwPlayerID, true)
						if NPCdusha then
							NPCdusha.SetCustomUnsigned4(0, dwPlayerID)
							NPClangya.SetCustomUnsigned1(10, 1)  --1������2������
							local cishu = NPClangya.GetCustomUnsigned1(11)
							if cishu == 0 then
								NPClangya.SetCustomUnsigned1(11, cishu + 1)  --��¼��ҷ��û��ص����������β��Ϊ2 �Ǳ�Ȼ�ɹ�����С��2��˵����·�Ϸ��������������	
							end
							player.AddBuff(0, 99, 6634, 1, 10)
							player.DelBuff(6649, 1)
							RemoteCallToClient(dwPlayerID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 9044), 8)
						end
						if NPCbiaoji1 then
							scene.DestroyNpc(NPCbiaoji1.dwID)
						end
						if NPCbiaoji2 then
							scene.DestroyNpc(NPCbiaoji2.dwID)
						end
					elseif GetDistanceSq(player.nX, player.nY, player.nZ, 110984, 117016, 1158272) <= 256 ^ 2 then --��һ���ڵ�������
						local NPCdusha = scene.CreateNpc(26347, 110984, 117016, 1158272, 63, 960, "dusha2" .. dwPlayerID, dwPlayerID, true)
						if NPCdusha then
							NPCdusha.SetCustomUnsigned4(0, dwPlayerID)
							NPClangya.SetCustomUnsigned1(10, 2)  ----1������2������
							local cishu = NPClangya.GetCustomUnsigned1(11)
							if cishu == 0 then
								NPClangya.SetCustomUnsigned1(11, cishu + 1)  --��¼��ҷ��û��ص����������β��Ϊ2 �Ǳ�Ȼ�ɹ�����С��2��˵����·�Ϸ��������������	
							end
							player.AddBuff(0, 99, 6634, 1, 10)
							player.DelBuff(6649, 1)
							RemoteCallToClient(dwPlayerID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 9044), 8)
						end
						if NPCbiaoji1 then
							scene.DestroyNpc(NPCbiaoji1.dwID)
						end
						if NPCbiaoji2 then
							scene.DestroyNpc(NPCbiaoji2.dwID)
						end
						NPClangya.SetCustomUnsigned1(4, 0)
					elseif GetDistanceSq(player.nX, player.nY, player.nZ, 114259, 118066, 1157376) <= 256 ^ 2 then--��ڵ�������
						local NPCdusha = scene.CreateNpc(26347, 114259, 118066, 1157376, 63, 960, "dusha1" .. dwPlayerID, dwPlayerID, true)
						if NPCdusha then
							NPCdusha.SetCustomUnsigned4(0, dwPlayerID)
							NPClangya.SetCustomUnsigned1(10, 1)  --������Ƭ�����ǣ�1Ϊ����2Ϊ�ұ�
							local cishu = NPClangya.GetCustomUnsigned1(11)
							if cishu == 1 then
								NPClangya.SetCustomUnsigned1(11, cishu + 1)  --��¼��ҷ��û��ص����������β��Ϊ2 �Ǳ�Ȼ�ɹ�����С��2��˵����·�Ϸ��������������	
							end
							player.AddBuff(0, 99, 6634, 1, 10)
							player.DelBuff(6649, 1)
							RemoteCallToClient(dwPlayerID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 9044), 8)
						end
						if NPCbiaoji1 then
							scene.DestroyNpc(NPCbiaoji1.dwID)
						end
						if NPCbiaoji2 then
							scene.DestroyNpc(NPCbiaoji2.dwID)
						end
						NPClangya.SetCustomUnsigned1(4, 0)
					elseif GetDistanceSq(player.nX, player.nY, player.nZ, 113308, 117220, 1157376) <= 256 ^ 2 then--��ڵ�������
						local NPCdusha = scene.CreateNpc(26347, 113308, 117220, 1157376, 63, 960, "dusha2" .. dwPlayerID, dwPlayerID, true)
						if NPCdusha then
							NPCdusha.SetCustomUnsigned4(0, dwPlayerID)
							NPClangya.SetCustomUnsigned1(10, 2)  --������Ƭ�����ǣ�1Ϊ����2Ϊ�ұ�
							local cishu = NPClangya.GetCustomUnsigned1(11)
							if cishu == 1 then
								NPClangya.SetCustomUnsigned1(11, cishu + 1)  --��¼��ҷ��û��ص����������β��Ϊ2 �Ǳ�Ȼ�ɹ�����С��2��˵����·�Ϸ��������������	
							end
							player.AddBuff(0, 99, 6634, 1, 10)
							player.DelBuff(6649, 1)
							RemoteCallToClient(dwPlayerID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 9044), 8)
						end
						if NPCbiaoji1 then
							scene.DestroyNpc(NPCbiaoji1.dwID)
						end
						if NPCbiaoji2 then
							scene.DestroyNpc(NPCbiaoji2.dwID)
						end
						NPClangya.SetCustomUnsigned1(4, 0)
					elseif GetDistanceSq(player.nX, player.nY, player.nZ, 112147, 115710, 1157376) <= 256 ^ 2 then --�ҽڵ�������
						local NPCdusha = scene.CreateNpc(26347, 112147, 115710, 1157376, 63, 960, "dusha1" .. dwPlayerID, dwPlayerID, true)
						if NPCdusha then
							NPCdusha.SetCustomUnsigned4(0, dwPlayerID)
							NPClangya.SetCustomUnsigned1(10, 1)  --������Ƭ�����ǣ�1Ϊ����2Ϊ�ұ�
							local cishu = NPClangya.GetCustomUnsigned1(11)
							if cishu == 1 then
								NPClangya.SetCustomUnsigned1(11, cishu + 1)  --��¼��ҷ��û��ص����������β��Ϊ2 �Ǳ�Ȼ�ɹ�����С��2��˵����·�Ϸ��������������	
							end
							player.AddBuff(0, 99, 6634, 1, 10)
							player.DelBuff(6649, 1)
							RemoteCallToClient(dwPlayerID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 9044), 8)
						end
						if NPCbiaoji1 then
							scene.DestroyNpc(NPCbiaoji1.dwID)
						end
						if NPCbiaoji2 then
							scene.DestroyNpc(NPCbiaoji2.dwID)
						end
						NPClangya.SetCustomUnsigned1(4, 0)
					elseif GetDistanceSq(player.nX, player.nY, player.nZ, 111703, 114974, 1157824) <= 256 ^ 2 then --�ҽڵ�������
						local NPCdusha = scene.CreateNpc(26347, 111703, 114974, 1157824, 63, 960, "dusha1" .. dwPlayerID, dwPlayerID, true)
						if NPCdusha then
							NPCdusha.SetCustomUnsigned4(0, dwPlayerID)
							NPClangya.SetCustomUnsigned1(10, 2)  --������Ƭ�����ǣ�1Ϊ����2Ϊ�ұ�
							local cishu = NPClangya.GetCustomUnsigned1(11)
							if cishu == 1 then
								NPClangya.SetCustomUnsigned1(11, cishu + 1)  --��¼��ҷ��û��ص����������β��Ϊ2 �Ǳ�Ȼ�ɹ�����С��2��˵����·�Ϸ��������������	
							end
							RemoteCallToClient(dwPlayerID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 9044), 8)
							player.AddBuff(0, 99, 6634, 1, 10)
							player.DelBuff(6649, 1)
						end
						if NPCbiaoji1 then
							scene.DestroyNpc(NPCbiaoji1.dwID)
						end
						if NPCbiaoji2 then
							scene.DestroyNpc(NPCbiaoji2.dwID)
						end
						NPClangya.SetCustomUnsigned1(4, 0)
					else
						player.SetTimer(4, "scripts/skill/Quest/�����ڳ�_���û���.lua", 0, 0)	
						--	player.ClearCDTime(635) --�������������CD����
						
					end		
				else
					player.SetTimer(4, "scripts/skill/Quest/�����ڳ�_���û���.lua", 0, 0)	
				end
			end
		end
		if nQuestIndex1 and nQuestPhase1 == 1 then
			if Value1 ~= 1 then
				if NPClangya then
					local dwPlayerID = NPClangya.GetCustomUnsigned4(0)
					if GetDistanceSq(player.nX, player.nY, player.nZ, 111818, 118050, 1157376) <= 256 ^ 2 then  --��һ���ڵ�������
						local NPCdusha = scene.CreateNpc(26347, 111833, 118051, 1157376, 128, 960, "dusha1" .. dwPlayerID, dwPlayerID, true)
						if NPCdusha then
							NPCdusha.SetCustomUnsigned4(0, dwPlayerID)
							NPClangya.SetCustomUnsigned1(10, 1)  --1������2������
							local cishu = NPClangya.GetCustomUnsigned1(11)
							if cishu == 0 then
								NPClangya.SetCustomUnsigned1(11, cishu + 1)  --��¼��ҷ��û��ص����������β��Ϊ2 �Ǳ�Ȼ�ɹ�����С��2��˵����·�Ϸ��������������	
							end
							player.AddBuff(0, 99, 6634, 1, 10)
							player.DelBuff(6649, 1)
							RemoteCallToClient(dwPlayerID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 9044), 8)
						end
						if NPCbiaoji1 then
							scene.DestroyNpc(NPCbiaoji1.dwID)
						end
						if NPCbiaoji2 then
							scene.DestroyNpc(NPCbiaoji2.dwID)
						end
					elseif GetDistanceSq(player.nX, player.nY, player.nZ, 110984, 117016, 1158272) <= 256 ^ 2 then --��һ���ڵ�������
						local NPCdusha = scene.CreateNpc(26347, 110984, 117016, 1158272, 63, 960, "dusha2" .. dwPlayerID, dwPlayerID, true)
						if NPCdusha then
							NPCdusha.SetCustomUnsigned4(0, dwPlayerID)
							NPClangya.SetCustomUnsigned1(10, 2)  ----1������2������
							local cishu = NPClangya.GetCustomUnsigned1(11)
							if cishu == 0 then
								NPClangya.SetCustomUnsigned1(11, cishu + 1)  --��¼��ҷ��û��ص����������β��Ϊ2 �Ǳ�Ȼ�ɹ�����С��2��˵����·�Ϸ��������������	
							end
							player.AddBuff(0, 99, 6634, 1, 10)
							player.DelBuff(6649, 1)
							RemoteCallToClient(dwPlayerID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 9044), 8)
						end
						if NPCbiaoji1 then
							scene.DestroyNpc(NPCbiaoji1.dwID)
						end
						if NPCbiaoji2 then
							scene.DestroyNpc(NPCbiaoji2.dwID)
						end
						NPClangya.SetCustomUnsigned1(4, 0)
					elseif GetDistanceSq(player.nX, player.nY, player.nZ, 114259, 118066, 1157376) <= 256 ^ 2 then--��ڵ�������
						local NPCdusha = scene.CreateNpc(26347, 114259, 118066, 1157376, 63, 960, "dusha1" .. dwPlayerID, dwPlayerID, true)
						if NPCdusha then
							NPCdusha.SetCustomUnsigned4(0, dwPlayerID)
							NPClangya.SetCustomUnsigned1(10, 1)  --������Ƭ�����ǣ�1Ϊ����2Ϊ�ұ�
							local cishu = NPClangya.GetCustomUnsigned1(11)
							if cishu == 1 then
								NPClangya.SetCustomUnsigned1(11, cishu + 1)  --��¼��ҷ��û��ص����������β��Ϊ2 �Ǳ�Ȼ�ɹ�����С��2��˵����·�Ϸ��������������	
							end
							player.AddBuff(0, 99, 6634, 1, 10)
							player.DelBuff(6649, 1)
							RemoteCallToClient(dwPlayerID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 9044), 8)
						end
						if NPCbiaoji1 then
							scene.DestroyNpc(NPCbiaoji1.dwID)
						end
						if NPCbiaoji2 then
							scene.DestroyNpc(NPCbiaoji2.dwID)
						end
						NPClangya.SetCustomUnsigned1(4, 0)
					elseif GetDistanceSq(player.nX, player.nY, player.nZ, 113308, 117220, 1157376) <= 256 ^ 2 then--��ڵ�������
						local NPCdusha = scene.CreateNpc(26347, 113308, 117220, 1157376, 63, 960, "dusha2" .. dwPlayerID, dwPlayerID, true)
						if NPCdusha then
							NPCdusha.SetCustomUnsigned4(0, dwPlayerID)
							NPClangya.SetCustomUnsigned1(10, 2)  --������Ƭ�����ǣ�1Ϊ����2Ϊ�ұ�
							local cishu = NPClangya.GetCustomUnsigned1(11)
							if cishu == 1 then
								NPClangya.SetCustomUnsigned1(11, cishu + 1)  --��¼��ҷ��û��ص����������β��Ϊ2 �Ǳ�Ȼ�ɹ�����С��2��˵����·�Ϸ��������������	
							end
							player.AddBuff(0, 99, 6634, 1, 10)
							player.DelBuff(6649, 1)
							RemoteCallToClient(dwPlayerID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 9044), 8)
						end
						if NPCbiaoji1 then
							scene.DestroyNpc(NPCbiaoji1.dwID)
						end
						if NPCbiaoji2 then
							scene.DestroyNpc(NPCbiaoji2.dwID)
						end
						NPClangya.SetCustomUnsigned1(4, 0)
					elseif GetDistanceSq(player.nX, player.nY, player.nZ, 112147, 115710, 1157376) <= 256 ^ 2 then --�ҽڵ�������
						local NPCdusha = scene.CreateNpc(26347, 112147, 115710, 1157376, 63, 960, "dusha1" .. dwPlayerID, dwPlayerID, true)
						if NPCdusha then
							NPCdusha.SetCustomUnsigned4(0, dwPlayerID)
							NPClangya.SetCustomUnsigned1(10, 1)  --������Ƭ�����ǣ�1Ϊ����2Ϊ�ұ�
							local cishu = NPClangya.GetCustomUnsigned1(11)
							if cishu == 1 then
								NPClangya.SetCustomUnsigned1(11, cishu + 1)  --��¼��ҷ��û��ص����������β��Ϊ2 �Ǳ�Ȼ�ɹ�����С��2��˵����·�Ϸ��������������	
							end
							player.AddBuff(0, 99, 6634, 1, 10)
							player.DelBuff(6649, 1)
							RemoteCallToClient(dwPlayerID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 9044), 8)
						end
						if NPCbiaoji1 then
							scene.DestroyNpc(NPCbiaoji1.dwID)
						end
						if NPCbiaoji2 then
							scene.DestroyNpc(NPCbiaoji2.dwID)
						end
						NPClangya.SetCustomUnsigned1(4, 0)
					elseif GetDistanceSq(player.nX, player.nY, player.nZ, 111703, 114974, 1157824) <= 256 ^ 2 then --�ҽڵ�������
						local NPCdusha = scene.CreateNpc(26347, 111703, 114974, 1157824, 63, 960, "dusha1" .. dwPlayerID, dwPlayerID, true)
						if NPCdusha then
							NPCdusha.SetCustomUnsigned4(0, dwPlayerID)
							NPClangya.SetCustomUnsigned1(10, 2)  --������Ƭ�����ǣ�1Ϊ����2Ϊ�ұ�
							local cishu = NPClangya.GetCustomUnsigned1(11)
							if cishu == 1 then
								NPClangya.SetCustomUnsigned1(11, cishu + 1)  --��¼��ҷ��û��ص����������β��Ϊ2 �Ǳ�Ȼ�ɹ�����С��2��˵����·�Ϸ��������������	
							end
							RemoteCallToClient(dwPlayerID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 9044), 8)
							player.AddBuff(0, 99, 6634, 1, 10)
							player.DelBuff(6649, 1)
						end
						if NPCbiaoji1 then
							scene.DestroyNpc(NPCbiaoji1.dwID)
						end
						if NPCbiaoji2 then
							scene.DestroyNpc(NPCbiaoji2.dwID)
						end
						NPClangya.SetCustomUnsigned1(4, 0)
					else
						player.SetTimer(4, "scripts/skill/Quest/�����ڳ�_���û���.lua", 0, 0)	
						--	player.ClearCDTime(635) --�������������CD����
						
					end		
				else
					player.SetTimer(4, "scripts/skill/Quest/�����ڳ�_���û���.lua", 0, 0)	
				end
			end
		end
	end
	return nPreResult;
end
function OnTimer(player, nParam1, nParam2)
	player.ClearCDTime(635) --�������������CD����
	RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 8702), 8)
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
	
end

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com