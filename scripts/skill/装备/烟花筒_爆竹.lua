---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�̻�Ͳ_����.lua
-- ����ʱ��:	2015/6/17 15:47:50
-- �����û�:	zhangyan3
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2013-1-24
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
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/װ��/�̻�Ͳ_����.lua",
		0
	);
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
	skill.AddSlowCheckSelfBuff(4052, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff
	skill.AddSlowCheckSelfBuff(3203, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff
	skill.AddSlowCheckDestBuff(10970, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ����Ŀ��Buff
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
	skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 573);	--������ͨCD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--ֻ��鲻�ߵ�CD
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

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
	skill.nPrepareFrames  	= 80;				-- ����֡��
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
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
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	local scene = player.GetScene()
	if not scene then
		return
	end

	if player.dwBackItemIndex ~= 8005 then -- ����ǲ���װ�˱����Ҽ��������� EQUIPMENT_REPRESENT.WAIST_EXTEND
		return SKILL_RESULT_CODE.FAILED
	end
	
	local dwMapID = scene.dwMapID
	if scene.nType == MAP_TYPE.DUNGEON or scene.nType == MAP_TYPE.BATTLE_FIELD then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4815), 5)
		return false
	end
	
	if dwMapID == 6 then--����
		if (player.nX > 43305 and player.nY > 54703) or (player.nX > 62571 and player.nY > 49799) then 
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4816), 5)
			return false
		end
	end	
	
	if dwMapID == 8 then--����
		if (player.nX > 11328 and player.nX < 25845 and player.nY > 80675) 
			or (player.nX >= 25845 and player.nX < 45595 and player.nY > 68267) then 
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4817), 5)
			return false
		end
	end

	if dwMapID == 15 then--����
		if (player.nX > 34859 and player.nX < 66897 and player.nY > 87317) then 
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4818), 5)
			return false
		end
	end	
	
	if dwMapID == 108 then--�ɶ�
		if (player.nX > 55204 and player.nX < 75576 and player.nY > 58997 and player.nY < 74838) then 
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4819), 5)
			return false
		end
	end
	if dwMapID == 22 then--����ɽ
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4820), 5)
		return false
	end	
	if dwMapID == 25 then--������
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4821), 5)
		return false
	end
	if dwMapID == 27 then--���˹�
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4822), 5)
		return false
	end
	if dwMapID == 30 then--����
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4823), 5)
		return false
	end		
	local bItemAmount = player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 18625)
	if bItemAmount == 0 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4824), 3)
		return false
	end
	local nTargetType, nTargetID = player.GetTarget()
	if nTargetType == TARGET.NPC then
		return false
	end
	local tPlayer = GetPlayer(nTargetID)
	if not tPlayer then
		return false
	end
	if tPlayer.bFightState == true then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4825), 3)
		return false
	end

	if tPlayer.GetBuff(11638, 1) then -- ������ֱ������ɧ��
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(11, 3288), 3)
		return false
	end
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
	
end

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID,dwSrcID)
	local tPlayer = GetPlayer(dwCharacterID)
	if not tPlayer then
		return
	end
	if tPlayer.bFightState == true then
		RemoteCallToClient(dwSrcID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4825), 3)
		cPlayer.ClearCDTime(573)
		return
	end
	local cPlayer = GetPlayer(dwSrcID)
	if not cPlayer then
		return
	end
	tCommonBuffID = {1653, 3337, 3838, 4099, 4248, 4359, 4787, 4740, 4993};
	for n = 1, #tCommonBuffID do 
		if tPlayer.GetBuff(tCommonBuffID[n], 0) then
			RemoteCallToClient(dwSrcID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4826), 3)
			cPlayer.ClearCDTime(573)
			return
		end
	end	

	local scene = cPlayer.GetScene()
	if not scene then
		return
	end
	local dwMapID = scene.dwMapID
	if scene.nType == MAP_TYPE.DUNGEON or scene.nType == MAP_TYPE.BATTLE_FIELD then
		RemoteCallToClient(cPlayer.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4815), 5)
		cPlayer.ClearCDTime(573)
		return
	end
	
	if dwMapID == 6 then--����
		if (cPlayer.nX > 43305 and cPlayer.nY > 54703) or (cPlayer.nX > 62571 and cPlayer.nY > 49799) then 
			RemoteCallToClient(cPlayer.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4816), 5)
			cPlayer.ClearCDTime(573)
			return
		end
	end	
	
	if dwMapID == 8 then--����
		if (cPlayer.nX > 11328 and cPlayer.nX < 25845 and cPlayer.nY > 80675) 
			or (cPlayer.nX >= 25845 and cPlayer.nX < 45595 and cPlayer.nY > 68267) then 
			RemoteCallToClient(cPlayer.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4817), 5)
			cPlayer.ClearCDTime(573)
			return
		end
	end

	if dwMapID == 15 then--����
		if (cPlayer.nX > 34859 and cPlayer.nX < 66897 and cPlayer.nY > 87317) then 
			RemoteCallToClient(cPlayer.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4818), 5)
			cPlayer.ClearCDTime(573)
			return
		end
	end	
	
	if dwMapID == 108 then--�ɶ�
		if (cPlayer.nX > 55204 and cPlayer.nX < 75576 and cPlayer.nY > 58997 and cPlayer.nY < 74838) then 
			RemoteCallToClient(cPlayer.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4819), 5)
			cPlayer.ClearCDTime(573)
			return
		end
	end
	if dwMapID == 22 then--����ɽ
		RemoteCallToClient(cPlayer.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4820), 5)
		return false
	end	
	if dwMapID == 25 then--������
		RemoteCallToClient(cPlayer.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4821), 5)
		return false
	end
	if dwMapID == 27 then--���˹�
		RemoteCallToClient(cPlayer.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4822), 5)
			return false
	end
	if dwMapID == 30 then--����
			RemoteCallToClient(cPlayer.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4823), 5)
			return false
	end		
	local bItemAmount = cPlayer.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 18625)
	if bItemAmount == 0 then
		RemoteCallToClient(cPlayer.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 4824), 3)
		cPlayer.ClearCDTime(573)
		return
	end
	tPlayer.AddBuff(0,99,5160,1)
	tPlayer.Stop()
	cPlayer.CastSkill(5229, 1, TARGET.PLAYER, tPlayer.dwID)
	tPlayer.DoAction(tPlayer.dwID,12112)
	cPlayer.CostItemInAllPackage(5,18625,1)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end


 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com