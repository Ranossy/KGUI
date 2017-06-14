------------------------------------------------
-- �ļ���    :  ����ɽ��_NPC_������_Ⱥ��ָ�.lua
-- ������    :  �²���
-- ����ʱ��  :  2009-04-20
-- ��;(ģ��):  ����NPC����
-- �书����  :  ����ɽ��
-- �书����  :  
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  ˲��AOE������Ѫ
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ nTherapyBase = 749   , nTherapyRand = 749   , nCostMana = 200  }, 
	{ nTherapyBase = 1270  , nTherapyRand = 1270  , nCostMana = 339  },
	{ nTherapyBase = 1821  , nTherapyRand = 1821  , nCostMana = 486  },
	{ nTherapyBase = 2650  , nTherapyRand = 2650  , nCostMana = 707  },
	{ nTherapyBase = 3478  , nTherapyRand = 3478  , nCostMana = 928  },
	{ nTherapyBase = 4785  , nTherapyRand = 4785  , nCostMana = 1276 },
	{ nTherapyBase = 5706  , nTherapyRand = 5706  , nCostMana = 1522 }, 
	{ nTherapyBase = 6626  , nTherapyRand = 6626  , nCostMana = 1767 },
	{ nTherapyBase = 7547  , nTherapyRand = 7547  , nCostMana = 2013 },
	{ nTherapyBase = 8467  , nTherapyRand = 8467  , nCostMana = 2258 },
	{ nTherapyBase = 9388  , nTherapyRand = 9388  , nCostMana = 2503 },
	{ nTherapyBase = 10309 , nTherapyRand = 10309 , nCostMana = 2749 },
	{ nTherapyBase = 11229 , nTherapyRand = 11229 , nCostMana = 2994 }, 
	{ nTherapyBase = 12150 , nTherapyRand = 12150 , nCostMana = 3240 },
	{ nTherapyBase = 13070 , nTherapyRand = 13070 , nCostMana = 3485 },
	{ nTherapyBase = 13991 , nTherapyRand = 13991 , nCostMana = 3731 },
	{ nTherapyBase = 14912 , nTherapyRand = 14912 , nCostMana = 3976 },
	{ nTherapyBase = 15832 , nTherapyRand = 15832 , nCostMana = 4222 },
	{ nTherapyBase = 16753 , nTherapyRand = 16753 , nCostMana = 4467 },
	{ nTherapyBase = 17673 , nTherapyRand = 17673 , nCostMana = 4713 },
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	
   	----------------- ħ������ -------------------------------------------------
	--ʩ�� �Ӽ���_�������󷨵�����
 	

   	
   	skill.AddAttribute(
  		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				-- ��������ģʽ
  		ATTRIBUTE_TYPE.CURRENT_MANA, 					-- ħ������
  		tSkillData[dwSkillLevel].nTherapyRand, 							--����ֵ1
  		0																--����ֵ2
 		);
   	
   	skill.AddAttribute(
  		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,						-- ��������ģʽ
  		ATTRIBUTE_TYPE.CALL_THERAPY,								-- ħ������
  		tSkillData[dwSkillLevel].nTherapyBase,				--����ֵ1
  		0							--����ֵ2
 		);
    
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
    --skill.BindBuff(1, 126, 1)			-- ����Buff  dwSkillLevel��ע����ȼ�һ��
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(1, 592, 1);				-- ����Hot 

    ----------------- ����Cool down --------------------------------------------
    --CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    skill.SetPublicCoolDown(16);

   	----------------- ����������� ---------------------------------------------
   	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
    --skill.dwLevelUpExp	= 0;    				-- ��������
    --skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;					-- ������������ֵ
    skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- �������ĵ�������ע������ܵȼ�һ��
    --skill.nCostRage		= 0;					-- �������ĵ�ŭ��
    --skill.nCostStamina	= 0;					-- �������ĵ�����
    --skill.nCostItemType	= 0;					-- �������ĵ���Ʒ����
    --skill.nCostItemIndex	= 0;					-- �������ĵ���Ʒ����ID
    
    ----------------- ������� -------------------------------------------------
    --skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
    --skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
    ----------------- ��״������� ---------------------------------------------
    --skill.nChainBranch	= 1;					--��״���ܷ�֧��
    --skill.nChainDepth		= 3;					--��״���ܲ���
    --��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
    ----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0;					-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 25 * LENGTH_BASE;					-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 20 * LENGTH_BASE;		-- �������ð뾶 
        skill.nTargetCountLimit	= 10;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    skill.nPrepareFrames  	= 48;				-- ����֡��
    --skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
    --skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
    --skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
    ----------------- ����� -------------------------------------------------
    --skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
    --skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
    --skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
    ----------------- ������ -------------------------------------------------
    --skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
    --skill.nBreakRate		= 0;					-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	--nWeaponDamagePercent		= 0;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
    return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end


function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com