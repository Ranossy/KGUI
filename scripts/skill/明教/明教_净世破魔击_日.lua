---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_������ħ��_��.lua
-- ����ʱ��:	2013/6/4 1:38:11
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  ֣����
-- ����ʱ��	:  20120621
-- Ч����ע	:  ���̼���
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nDamageBase = 86*0.95, 	nDamageRand = 86*0.1,  nCostMana = 30 },
	{nDamageBase = 100*0.95, 	nDamageRand = 100*0.1,  nCostMana = 50 },
	{nDamageBase = 114*0.95, 	nDamageRand = 114*0.1,  nCostMana = 67 },
	{nDamageBase = 128*0.95, 	nDamageRand = 128*0.1,  nCostMana = 93 },
	{nDamageBase = 142*0.95, 	nDamageRand = 142*0.1,  nCostMana = 111},
	{nDamageBase = 156*0.95, 	nDamageRand = 156*0.1,  nCostMana = 130},
	{nDamageBase = 170*0.95, 	nDamageRand = 170*0.1,  nCostMana = 149},
	{nDamageBase = 184*0.95, 	nDamageRand = 184*0.1,  nCostMana = 167},
	{nDamageBase = 198*0.95, 	nDamageRand = 198*0.1,  nCostMana = 186},
	{nDamageBase = 212*0.95, 	nDamageRand = 212*0.1,  nCostMana = 186},
	{nDamageBase = 226*0.95, 	nDamageRand = 226*0.1,  nCostMana = 30 },
	{nDamageBase = 240*0.95, 	nDamageRand = 240*0.1,  nCostMana = 50 },
	{nDamageBase = 254*0.95, 	nDamageRand = 254*0.1,  nCostMana = 67 },
	{nDamageBase = 268*0.95, 	nDamageRand = 268*0.1,  nCostMana = 93 },
	{nDamageBase = 282*0.95, 	nDamageRand = 282*0.1,  nCostMana = 111},
	{nDamageBase = 296*0.95, 	nDamageRand = 296*0.1,  nCostMana = 130},
	{nDamageBase = 310*0.95, 	nDamageRand = 310*0.1,  nCostMana = 149},
	{nDamageBase = 324*0.95, 	nDamageRand = 324*0.1,  nCostMana = 167},
	{nDamageBase = 338*0.95, 	nDamageRand = 338*0.1,  nCostMana = 186},
	{nDamageBase = 352*0.95, 	nDamageRand = 352*0.1,  nCostMana = 186},
	{nDamageBase = 366*0.95, 	nDamageRand = 366*0.1,  nCostMana = 30 },
	{nDamageBase = 380*0.95, 	nDamageRand = 380*0.1,  nCostMana = 50 },
	{nDamageBase = 394*0.95, 	nDamageRand = 394*0.1,  nCostMana = 67 },
	{nDamageBase = 408*0.95, 	nDamageRand = 408*0.1,  nCostMana = 93 },
	{nDamageBase = 422*0.95, 	nDamageRand = 422*0.1,  nCostMana = 111},
	{nDamageBase = 436*0.95, 	nDamageRand = 436*0.1,  nCostMana = 130},
	{nDamageBase = 450*0.95, 	nDamageRand = 450*0.1,  nCostMana = 149},
	{nDamageBase = 464*0.95, 	nDamageRand = 464*0.1,  nCostMana = 167},
	{nDamageBase = 478*0.95, 	nDamageRand = 478*0.1,  nCostMana = 186},
	{nDamageBase = 492*0.95, 	nDamageRand = 492*0.1,  nCostMana = 186},
	{nDamageBase = 506*0.95, 	nDamageRand = 506*0.1,  nCostMana = 186},
	{nDamageBase = 520*0.95, 	nDamageRand = 520*0.1,  nCostMana = 186},
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
	

	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
	--ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,
	--tSkillData[dwSkillLevel].nSOLARDamage,
	--0
	--);

	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
	--ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,
	--tSkillData[dwSkillLevel].nSOLARDamageRand,
	--0
	--);
    
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
	--ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,
	--0, 
	--0
	--);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/����_������ħ��_��.lua",
		0														
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/90����Ѩ/����AOE.lua",
		0														
	);
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, BUFF_COMPARE_FLAG.GREATER_EQUAL, nLevel, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, BUFF_COMPARE_FLAG.GREATER_EQUAL, nLevel, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, BUFF_COMPARE_FLAG.GREATER_EQUAL, nLevel, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, BUFF_COMPARE_FLAG.GREATER_EQUAL, nLevel, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- ����Ŀ�������Լ���Buff   

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
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
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 10 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ
	skill.nAreaRadius = 8 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit = 8;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nChannelInterval	=80; 				-- ͨ�������ʱ�� 
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
	--skill.nWeaponDamagePercent		= 2048;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
	return true;
end



-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������

end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
	
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then 
		return
	end
	--local target
	if not player.GetBuff(4706, 1) then
		player.CastSkill(4969, 1)
	else
		return
	end
	local buff = player.GetBuff(4706, 1)
	if not buff then 
		return
	end
	local stack = buff.nStackNum
	local level = player.GetSkillLevel(3967)

	--����Ŀ������ֱ�Ӵ�����˺���AOE
	if player.GetSkillLevel(5985) == 1 then
		if IsPlayer(dwCharacterID) then
			player.CastSkill(14701, level, TARGET.PLAYER, dwCharacterID)
		else
			player.CastSkill(14701, level, TARGET.NPC, dwCharacterID)
		end
	else
		if IsPlayer(dwCharacterID) then
			player.CastSkill(4482 + stack, level, TARGET.PLAYER, dwCharacterID)
		else
			player.CastSkill(4482 + stack, level, TARGET.NPC, dwCharacterID)
		end
	end
	--player.DelGroupBuff(4706, 1)
	--[[
	if player.GetSkillLevel(17567) == 1 then
		player.AddBuff(player.dwID,player.nLevel,11866,1,2)
	end
	--]]
end



--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com