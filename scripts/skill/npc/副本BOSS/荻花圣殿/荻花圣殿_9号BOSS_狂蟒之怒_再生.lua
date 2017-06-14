------------------------------------------------
-- �ļ���    :  ݶ��ʥ��_9��BOSS_����֮ŭ_����.lua
-- ������    :  �ź�		
-- ����ʱ��  :  2011-3-27
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  �����Լ�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ nTherapyBase = 169000, 	nTherapyRand = 600,	nCostMana = 199 * 0.9},		--level 1
	{ nTherapyBase = 306000, 	nTherapyRand = 1900,	nCostMana = 199 * 0.9},		--level 2
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},		--level 3
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},		--level 4
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},		--level 5
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},		--level 6
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},		--level 7
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},	  --level 8
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},		--level 9
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9}, 	--level 10
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},		--level 11
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},		--level 12
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},		--level 13
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},		--level 14
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},		--level 15
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},		--level 16
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},		--level 17
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},		--level 18
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},		--level 19
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},		--level 20
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},		--level 21
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},		--level 22
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},		--level 23
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},		--level 24
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},		--level 25
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},		--level 26
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},		--level 27
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},		--level 28
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},		--level 29
	{ nTherapyBase = 567, 	nTherapyRand = 60,	nCostMana = 199 * 0.9},		--level 30
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------
  skill.AddAttribute( 
   ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,                        
		ATTRIBUTE_TYPE.SKILL_THERAPY,                                     
		tSkillData[dwSkillLevel].nTherapyBase * 0.14,                                     
		0                                                                         
	);                                                                            
                                                                                  
	skill.AddAttribute(                                                           
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,                        
		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND,                                 
		tSkillData[dwSkillLevel].nTherapyRand * 0.14,                                     
		0                                                                         
	);                                                                                                                                                             

  skill.AddAttribute(                                                           
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,                        
		ATTRIBUTE_TYPE.CALL_THERAPY,                                       
		0,                                                                        
		0                                                                         
	);
	
		skill.AddAttribute(
   			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,			-- ��������ģʽ
   			ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
   			"skill/npc/����BOSS/ݶ��ʥ��/ݶ��ʥ��_9��BOSS_����֮ŭ_����.lua",								--����ֵ1
   			0															--����ֵ2
   		);
    
	skill.AddAttribute(
   			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			-- ��������ģʽ
   			ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
   			"skill/npc/����BOSS/ݶ��ʥ��/ݶ��ʥ��_9��BOSS_����֮ŭ_�ƶ���ͷ.lua",								--����ֵ1
   			0															--����ֵ2
   		);
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
    --skill.BindBuff(1,tSkillData[dwSkillLevel].nBuffID,tSkillData[dwSkillLevel].nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

    ----------------- ����Cool down --------------------------------------------
    --CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetCoolDown(1, 16);						-- ����CD 1.5��
    --skill.SetCoolDown(CoolDownIndex, nCoolDownID);

   	----------------- ����������� ---------------------------------------------
   	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
    --skill.dwLevelUpExp	= 0;    				-- ��������
    --skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

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
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius		= 30 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit	= 30; 			-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
      skill.nPrepareFrames  	= 48;				-- ����֡��
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
    --skill.nSelfLifePercentMin	= 0;			-- Ѫ����Сֵ>=
    --skill.nSelfLifePercentMax	= 100;			-- Ѫ�����ֵ<=
    
    ----------------- ������ -------------------------------------------------
   -- skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
    --skill.nBrokenRate         = 0 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
    --skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
    return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
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
	local cNpc = GetNpc(dwCharacterID)
	if not cNpc then
		return
	end
	cNpc.SetCustomBoolean(14,false)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com