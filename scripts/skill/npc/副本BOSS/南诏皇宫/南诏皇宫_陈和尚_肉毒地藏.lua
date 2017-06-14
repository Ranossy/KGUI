------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2012-9-13
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 1700, nDamageRand = 0, nCostMana = 0},		--level 1
	{nDamageBase = 1700, nDamageRand = 0, nCostMana = 0},		--level 2
	{nDamageBase = 1700, nDamageRand = 0, nCostMana = 0},		--level 3
	{nDamageBase = 1700, nDamageRand = 0, nCostMana = 0},		--level 4
	{nDamageBase = 1700, nDamageRand = 0, nCostMana = 0},		--level 5
	{nDamageBase = 1700, nDamageRand = 0, nCostMana = 0},		--level 6
	{nDamageBase = 1700, nDamageRand = 0, nCostMana = 0},		--level 7
	{nDamageBase = 1700, nDamageRand = 0, nCostMana = 0},		--level 8
	{nDamageBase = 1700, nDamageRand = 0, nCostMana = 0},		--level 9
	{nDamageBase = 1700, nDamageRand = 0, nCostMana = 0}, 		--level 10
	{nDamageBase = 3600, nDamageRand = 0, nCostMana = 0},		--level 11
	{nDamageBase = 3600, nDamageRand = 0, nCostMana = 0},		--level 12
	{nDamageBase = 3600, nDamageRand = 0, nCostMana = 0},		--level 13
	{nDamageBase = 3600, nDamageRand = 0, nCostMana = 0},		--level 14
	{nDamageBase = 3600, nDamageRand = 0, nCostMana = 0},		--level 15
	{nDamageBase = 3600, nDamageRand = 0, nCostMana = 0},		--level 16
	{nDamageBase = 3600, nDamageRand = 0, nCostMana = 0},		--level 17
	{nDamageBase = 3600, nDamageRand = 0, nCostMana = 0},		--level 18
	{nDamageBase = 3600, nDamageRand = 0, nCostMana = 0},		--level 19
	{nDamageBase = 3600, nDamageRand = 0, nCostMana = 0},		--level 20	
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
	
	skill.AddAttribute( 
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,                        
		ATTRIBUTE_TYPE.SKILL_POISON_DAMAGE,                                      
		tSkillData[dwSkillLevel].nDamageBase * 0.14,                                     
		0                                                                         
	);                                                                            
                                                                                  
	skill.AddAttribute(                                                           
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,                        
		ATTRIBUTE_TYPE.SKILL_POISON_DAMAGE_RAND,                                 
		tSkillData[dwSkillLevel].nDamageRand * 0.14,                                     
		0                                                                         
	);                                                                            
                                                                                  
	skill.AddAttribute(                                                           
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,                        
		ATTRIBUTE_TYPE.CALL_POISON_DAMAGE,                                       
		0,                                                                        
		0                                                                         
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,			-- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
		"skill/npc/����BOSS/��گ�ʹ�/��گ�ʹ�_�º���_�ⶾ�ز�.lua",								--����ֵ1
		0															--����ֵ2
	);	

	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff   

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 4405, 1);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--������ͨCD
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
	skill.nMaxRadius		= 4 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	if dwSkillLevel < 11 then
		skill.nAreaRadius = 3 * LENGTH_BASE + dwSkillLevel * LENGTH_BASE;		-- �������ð뾶
	else
		skill.nAreaRadius = 3 * LENGTH_BASE + (dwSkillLevel-10) * LENGTH_BASE;		-- �������ð뾶
	end
	skill.nTargetCountLimit	= 30;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
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
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
	
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	if not cPlayer then
		return
	end
	local scene = cPlayer.GetScene()
	if not scene then
		return
	end
	if scene.dwMapID == 140 then
		local nBuff1 = cPlayer.GetBuff(4405, 1)
		local nBuff2 = cPlayer.GetBuff(4403, 1)
		local nBuff3 = cPlayer.GetBuff(4404, 1)
		if nBuff3 then
			if nBuff3.nStackNum < 2 then
				cPlayer.AddBuff(0, 99, 4404, 1)
			elseif nBuff3.nStackNum == 2 then
				cPlayer.DelGroupBuff(4404, 1)
				cPlayer.AddBuff(0,99,4455,1)
			end
		end
		if nBuff2 then
			if nBuff2.nStackNum < 2 then
				cPlayer.AddBuff(0, 99, 4403, 1)
			elseif nBuff2.nStackNum == 2 then
				cPlayer.DelGroupBuff(4403, 1)
				cPlayer.AddBuff(0,99,4404,1)
			end
		end
		if not nBuff1 and not nBuff2 and not nBuff3  and not cPlayer.GetBuff(4455,1) then
			cPlayer.AddBuff(0,99,4405,1)
		end
		if nBuff1 then
			if nBuff1.nStackNum < 3 then
				cPlayer.AddBuff(0, 99, 4405, 1)
			elseif nBuff1.nStackNum == 3 then
				cPlayer.DelGroupBuff(4405, 1)
				cPlayer.AddBuff(0,99,4403,1)
			end
		end
	end
	if scene.dwMapID == 155 then
		local nBuff4 = cPlayer.GetBuff(4405, 2)
		local nBuff5 = cPlayer.GetBuff(4403, 2)
		local nBuff6 = cPlayer.GetBuff(4404, 2)
		if nBuff6 then
			if nBuff6.nStackNum < 2 then
				cPlayer.AddBuff(0, 99, 4404, 2)
			elseif nBuff6.nStackNum == 2 then
				cPlayer.DelGroupBuff(4404, 2)
				cPlayer.AddBuff(0,99,4455,2)
			end
		end
		if nBuff5 then
			if nBuff5.nStackNum < 2 then
				cPlayer.AddBuff(0, 99, 4403, 2)
			elseif nBuff5.nStackNum == 2 then
				cPlayer.DelGroupBuff(4403, 2)
				cPlayer.AddBuff(0,99,4404,2)
			end
		end
		if not nBuff4 and not nBuff5 and not nBuff6  and not cPlayer.GetBuff(4455,2) then
			cPlayer.AddBuff(0,99,4405,2)
		end
		if nBuff4 then
			if nBuff4.nStackNum < 3 then
				cPlayer.AddBuff(0, 99, 4405, 2)
			elseif nBuff4.nStackNum == 3 then
				cPlayer.DelGroupBuff(4405, 2)
				cPlayer.AddBuff(0,99,4403,2)
			end
		end
	end

end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com